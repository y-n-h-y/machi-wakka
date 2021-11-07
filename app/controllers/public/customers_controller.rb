class Public::CustomersController < ApplicationController
  def like
    @favorites = current_customer.favorites
    @shop = @favorites.where(shop_id: params[:shop_id])
  end

  def top
    @customer = current_customer.id
    @favorite = current_customer.favorites
  end

  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def confirm
  end

  def withdrawal
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :state, :city)
  end
end
