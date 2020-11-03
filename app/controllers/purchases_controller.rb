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
      @card.save
      redirect_to :index
    else
      render :index
    end
  end

  private

  def card_params
    params.permit(:prefecture_id, :municipalities, :address, :postal_code, :building_number, :telephone_number)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to controller: :items, action: :index
    end
  end

  def move_to_index_bought
    if @item.blank?
      redirect_to controller: :items, action: :index
    end
  end
end