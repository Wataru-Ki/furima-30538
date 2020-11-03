class PurchasesController < ApplicationController
  def index
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
    params.permit(:prefecture, :municipalities, :address, :postal_code, :building_number, :telephone_number)
  end
end