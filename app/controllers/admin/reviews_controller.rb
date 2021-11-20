class Admin::ReviewsController < ApplicationController
  def index
    @shop= current_admin.shop.id
    @reviews = current_admin.shop.reviews
  end

  def show
    @review = Review.find(params[:id])
  end
end
