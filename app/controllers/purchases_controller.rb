class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:move_to_index, :move_to_index_bought, :pay_item, :index, :create]
  before_action :move_to_index_bought
  before_action :move_to_index

  def index
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
    params.require(:card).permit(:prefecture_id, :municipalities, :address, :postal_code, :building_number, :telephone_number).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_index_bought
    @item = Item.find(params[:item_id])
    if @item.purchase.present?
      redirect_to root_path
    end
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: card_params[:token],
        currency: 'jpy'
      )
  end
end