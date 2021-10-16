class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.shop_id = current_admin.shop.id
   if  @item.save
     redirect_to admin_shop_items_path
   else
     render :new
   end
  end

  def index
    @items = current_admin.shop.items
    @shop = current_admin.shop.id
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_shop_items_path(@item)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to admin_shop_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :price)
  end
end
