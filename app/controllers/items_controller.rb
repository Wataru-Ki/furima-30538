class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: :show

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :introduction, :shipping_area_id, :shipping_date_id, :shipping_charge_id, :category_id, :item_condition_id, :image).merge(user_id: current_user.id)
  end
end
