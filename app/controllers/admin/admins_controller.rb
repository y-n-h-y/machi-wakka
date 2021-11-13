class Admin::AdminsController < ApplicationController
  def show
    @admin = current_admin
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to admin_admin_path(@admin)
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawal
  end

  private

  def admin_params
    params.require(:admin).permit(:company_name, :name, :name_kana, :email, :phone, :is_active)
  end
end
