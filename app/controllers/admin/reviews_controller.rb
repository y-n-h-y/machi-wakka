class Admin::ReviewsController < ApplicationController
  def index
    @reviews = current_admin.shop.reviews
  end

  def show
    @review = current_admin.shop.review
  end
end
