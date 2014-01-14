class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation,:phone_no,:blood_group,
          :country_id,:state_id,:district_id,:terms_of_service,:phone_no_visibility,:can_send_email,:can_send_sms)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation,:phone_no,:blood_group,
               :country_id,:state_id,:district_id,:terms_of_service,:phone_no_visibility,:can_send_email,:can_send_sms)
    end
  end
end

