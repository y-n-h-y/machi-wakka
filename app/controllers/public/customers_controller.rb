class Public::CustomersController < ApplicationController
  def like
    @like = current_customer.favorites
    @current_like = @like.where(shop_id: [:shop_id])
  end

  def show
    @customer = current_customer.id
  end

  def edit
  end

  def update
  end

  def confirm
  end

  def withdrawal
  end
end
