class Admin::ShopsController < ApplicationController

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)

    if @shop.save
      redirect_to admin_shop_path(@shop)
    else
      render :new
    end
  end

  def top
    @shop = Shop.ids
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to admin_shop_path(@shop)
    else
      render :edit
    end
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :shop_genre, :postal_code, :state, :city, :address, :phone, :access, :parking, :business_hours, :holiday, :credit_card, :cash_less, :homepage, :logo)
  end
end
