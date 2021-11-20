class Admin::ServicesController < ApplicationController
  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.shop_id = current_admin.shop.id
    if @service.save
      redirect_to admin_shop_services_path
    else
      render :new
    end
  end

  def index
    @services = current_admin.shop.services
    @shop = current_admin.shop.id
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to admin_shop_services_path
    else
      render :edit
    end
  end

  def destroy
    service = Service.find(params[:id])
    service.destroy
    redirect_to admin_shop_services_path
  end

  private

  def service_params
    params.require(:service).permit(:shop_id, :title, :content)
  end
end
