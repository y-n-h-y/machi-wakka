class Public::ShopsController < ApplicationController

  before_action :set_search, only: [:index, :search]

  def set_search
    @search = Shop.ransack(params[:q])
  end

  def index
    @search = Shop.search(search_params)
    @shops = @search.result(distinct: true)
  end

  def show
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
