class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index_bought
  before_action :move_to_index

  def index
    # @card = Card.new
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.valid?
      pay_item
      @card.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def card_params
    params.permit(:prefecture_id, :municipalities, :address, :postal_code, :building_number, :telephone_number).merge(token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to controller: :items, action: :index
    end
  end

  def move_to_index_bought
    @item = Item.find(params[:item_id])
    if @item.blank?
      redirect_to controller: :items, action: :index
    end
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: card_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end
end