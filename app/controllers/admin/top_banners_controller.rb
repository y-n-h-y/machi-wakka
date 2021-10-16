class Admin::TopBannersController < ApplicationController

  def new
    @top_banner = TopBanner.new
    @shop = Shop.ids
  end

  def create
    @top_banner = TopBanner.new(top_banner_params)
    if @top_banner.save
      redirect_to admin_shop_top_banners_path
    else
      render :new
    end
  end

  def index
    @top_banners = current_admin.shop.top_banners
    @shop = Shop.ids
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def top_banner_params
    params.require(:top_banner).permit(:image)
  end

end
