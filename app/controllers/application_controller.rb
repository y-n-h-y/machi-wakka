class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customer
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
      root_path # ログアウト後に遷移するpathを設定
    else
      new_admin_session_path
    end
  end

  def set_search
    @search = Shop.ransack(params[:q])
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :state, :city, :is_active, :phone, :company_name])
  end
end
