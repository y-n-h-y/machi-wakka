class Public::HomesController < ApplicationController
  def top
    @shop = Shop.find(Favorite.group(:shop_id).order('count(shop_id) desc').limit(3).pluck(:shop_id))
    @reviews = Review.all.order(created_at: :desc).limit(4)
  end
end
