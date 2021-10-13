class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @shop = Shop.ids
  end

  def create
    @item = Item.new(item_params)
    @item.admin_id = current_admin.id
   if  @item.save
     redirect_to admin_shop_items_path
   else
     render :new
   end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find_by(shop_id: params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:admin_id, :shop_id, :name, :image, :content, :price)
  end
end
