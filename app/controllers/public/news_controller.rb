class Public::NewsController < ApplicationController
  def index
  end

  def show
    @news = News.find(params[:id])
    @shop = @news.shop.id
  end
end
