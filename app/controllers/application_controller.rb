class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features])
      devise_parameter_sanitizer.permit(:account_update, keys: [:category_id, :prefecture_id, :name, :place, :tel, :manage, :num_of_stylists, :num_of_sheets, :cut_price, :features])
    end

    def after_sign_in_path_for(resource)
      case resource
      when Salon
        admin_salon_path
      when Stylist
        admin_stylist_path
      when User
        user_path(resource)
      end
    end
end
