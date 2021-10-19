class Public::ShopsController < ApplicationController

  before_action :set_search, only: [:index, :search]

  def set_search
    @search = Shop.ransack(params[:q])
  end

  def index
    @shops = Shop.all
    # @search = Shop.search(search_params)
    # @shops = @search.result(distinct: true)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def search
    @search = Shop.search(search_params)
    @shops = @search.result(distinct: true)
  end

  private

  def search_params
    params.require(:q).permit(:state_eq, :shop_genre_eq)
  end
end
