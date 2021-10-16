class Admin::TopBannersController < ApplicationController

  def new
    @top_banner = TopBanner.new
  end

  def create
    @top_banner = TopBanner.new(top_banner_params)
    @top_banner.shop_id = current_admin.shop.id
    if @top_banner.save
      redirect_to admin_shop_top_banners_path
    else
      render :new
    end
  end

  def index
    @top_banners = current_admin.shop.top_banners
    @shop = current_admin.shop.id
  end

  def edit
    @top_banner = TopBanner.find(params[:id])
  end

  def update
    @top_banner = TopBanner.find(params[:id])
    if @top_banner.update(top_banner_params)
      redirect_to admin_shop_top_banner_path(@news)
    else
      render :edit
    end
  end

  def destroy
    top_banner = TopBanner.find(params[:id])
    top_banner.destroy
    redirect_to admin_shop_top_banners_path
  end

  private

  def top_banner_params
    params.require(:top_banner).permit(:shop_id, :image)
  end

end
