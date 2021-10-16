class Admin::NewsController < ApplicationController
  def new
    @news = News.new
    @shop = Shop.ids
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to admin_shop_news_index_path
    else
      render :new
    end
  end

  def index
    @current_news = current_admin.shop.news
    @shop = Shop.ids
    @news = News.find(params[:shop_id])
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def news_params
    params.require(:news).permit(:shop_id, :title, :image, :content)
  end
end
