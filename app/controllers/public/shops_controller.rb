class Public::ShopsController < ApplicationController

  before_action :set_search, only: [:index, :search]

  def index
    @shops = Shop.all
    @top_banner = TopBanner.find(1)
    # @search = Shop.search(search_params)
    # @shops = @search.result(distinct: true)
  end

  def show
    @shop = Shop.find(params[:id])
    @top_banners = @shop.top_banners
    @items = @shop.items
    @news = @shop.news
    @services = @shop.services
    @reviews = @shop.reviews.order(created_at: :desc)
    @review = Review.new
  end

  def search
    @shops = @q.result
  end

  private

  def set_search
    @q = Shop.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:address_cont, :shop_genre_eq)
  end
end
