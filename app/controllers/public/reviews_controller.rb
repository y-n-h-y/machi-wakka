class Public::ReviewsController < ApplicationController
  def new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = current_customer.reviews.new(review_params)
    @review.shop_id = @shop.id
    @review.save
    redirect_to shop_path(@shop)
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
