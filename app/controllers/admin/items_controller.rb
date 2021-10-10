class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
    @shop = current_admin.shop.id
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:shop_id, :name, :image, :content)
  end
end
