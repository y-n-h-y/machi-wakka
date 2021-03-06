class Public::ReviewsController < ApplicationController
  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = current_customer.reviews.new(review_params)
    @review.shop_id = @shop.id
    if @review.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
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
    review = Review.find(params[:id])
    @shop = review.shop.id
    review.destroy
    redirect_to shop_path(@shop)
  end

  private

  def review_params
    params.require(:review).permit(:title, :content)
  end
end
