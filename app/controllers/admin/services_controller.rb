class Admin::ServicesController < ApplicationController
  def new
    @service = Service.new
    @shop = Shop.ids
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_to admin_shop_services_path
    else
      render :new
    end
  end

  def index
    @services = current_admin.shop.services
    @shop = Shop.ids
    @service = Service.find(params[:shop_id])
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

  def service_params
    params.require(:service).permit(:shop_id, :title, :content)
  end
end
