class Admin::TopBannersController < ApplicationController

  def new
    @top_banner = TopBanner.new
    @shop = current_admin.shop.id
  end

  def create
    @top_banner = TopBanner.new(top_banner_params)
    @top_banner.save
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def top_banner_params
    params.require(:top_banner).permit(:shop_id, :title, :content)
  end

end
