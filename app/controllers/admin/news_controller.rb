class Admin::NewsController < ApplicationController
  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @news.shop_id = current_admin.shop.id
    if @news.save
      redirect_to admin_shop_news_index_path
    else
      render :new
    end
  end

  def index
    @current_news = current_admin.shop.news.order(created_at: :desc)
    @shop = current_admin.shop.id
  end

  def show
    @news = News.find(params[:id])
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to admin_shop_news_path(@news)
    else
      render :edit
    end
  end

  def destroy
    news = News.find(params[:id])
    news.destroy
    redirect_to admin_shop_news_index_path
  end

  private

  def news_params
    params.require(:news).permit(:shop_id, :genre, :title, :image, :content)
  end
end
