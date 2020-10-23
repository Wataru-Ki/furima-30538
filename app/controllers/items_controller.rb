class ItemsController < ApplicationController


  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :shipping_area_id, :shipping_date_id, :shipping_charge_id, :category_id, :item_condition_id, :image).merge(user_id: current_user.id)
  end
end
