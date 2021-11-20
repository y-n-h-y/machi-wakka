class Admin::HomesController < ApplicationController
  def top
    @shop = current_admin.shop
  end
end
