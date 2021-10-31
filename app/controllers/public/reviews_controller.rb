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
    @reviews = current_customer.reviews
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @shop = @review.shop.id
    if @review.update(review_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
