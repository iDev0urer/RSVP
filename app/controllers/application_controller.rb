class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :name, :address, :password, :password_confirmation) }
  end

  def after_sign_in_path_for(resource)
    sign_in_url = new_user_session_url
    if request.referer == sign_in_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
    end

  def after_sign_up_path_for(resource)
    sign_up_url = new_user_session_url
    if request.referer == sign_up_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end
