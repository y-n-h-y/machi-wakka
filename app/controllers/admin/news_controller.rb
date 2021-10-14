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
    @news = News.all
  end

  def show
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
