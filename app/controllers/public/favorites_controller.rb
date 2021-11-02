class Public::FavoritesController < ApplicationController
  def create
    @shop = Shop.find(params[:id])
    @favorite = current_customer.favorites.new(shop_id: shop.id)
    @favorite.save
    redirect_to shop_path(@shop)
  end

  def index
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @favorite = current_customer.favorites.find_by(shop_id: shop.id)
    @favorite.destroy
    redirect_to shop_path(@shop)
  end
end
