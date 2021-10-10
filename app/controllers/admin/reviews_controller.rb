class Admin::ReviewsController < ApplicationController
  def index
    @shop = current_admin.shop
  end

  def show
  end
end
