class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @shop = Shop.ids
  end

  def create
    @item = Item.new(item_params)
   if  @item.save
     redirect_to admin_shop_items_path
   else
     render :new
   end
  end

  def index
    @items = Item.all
    @shop = Shop.ids
    @item = Item.find(params[:shop_id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:shop_id, :name, :image, :content, :price)
  end
end
