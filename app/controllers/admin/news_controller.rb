class Admin::NewsController < ApplicationController
  def new
    @news = News.new
  end

  def create
    @news = News.new(news_params)
    @news.save
  end

  def index
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
