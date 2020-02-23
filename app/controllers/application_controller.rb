class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :fav_country, :fav_spot, :introduction, :sns_hp])
    end

    def after_signed_in_path_for(resource)
      '/posts/all'
    end

    def after_signed_out_path_for(resource)
      '/users/sign_in'
    end
end