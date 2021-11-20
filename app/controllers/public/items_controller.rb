class Public::ItemsController < ApplicationController
  def index
  end

  def show
    @item = Item.find(params[:id])
    @shop = @item.shop.id
  end
end
