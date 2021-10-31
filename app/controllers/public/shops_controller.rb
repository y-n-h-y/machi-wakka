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
    @reviews = @shop.reviews
    @review = Review.new
    @current_review = current_customer.reviews
  end

  def search
    @shops = @q.result
    @top_banner = TopBanner.find(1)
  end

  private

  def set_search
    @q = Shop.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:state_eq, :shop_genre_eq, :city_or_address_cont)
  end
end
