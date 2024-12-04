class ApplicationController < ActionController::Base
  include NeedsHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location
  # before_filter :prepare_for_mobile
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :alert => exception.message
  end

  protected

  MOBILE_USER_AGENTS =  'Mobile|webOS|palm|blackberry|nokia|phone|midp|mobi|symbian|chtml|ericsson|minimo|' +
      'audiovox|motorola|samsung|telit|upg1|windows ce|ucweb|astel|plucker|' +
      'x320|x240|j2me|sgh|portable|sprint|docomo|kddi|softbank|android|mmp|' +
      'pdxgw|netfront|xiino|vodafone|portalmmm|sagem|mot-|sie-|ipod|up\\.b|' +
      'webos|amoi|novarra|cdm|alcatel|pocket|ipad|iphone|mobileexplorer|' +
      'mobile|zune'

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name, :email, :password, :password_confirmation, :phone_no, :blood_group,
      :country_id, :state_id, :district_id, :terms_of_service, :phone_no_visibility,
      :can_send_email, :can_send_sms, :avatar, :is_donor
    ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name, :email, :password, :password_confirmation, :phone_no, :blood_group,
      :country_id, :state_id, :district_id, :terms_of_service, :phone_no_visibility,
      :can_send_email, :can_send_sms, :avatar, :is_donor
    ])
  end


  private

  def mobile_device?
    if session[:mobile_param]
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end
  helper_method :mobile_device?

  def prepare_for_mobile
    session[:mobile_param] = params[:mobile] if params[:mobile]
    request.format = :mobile if mobile_device?
  end

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
     root_path
  end

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
    if session[:need].present?
      @need = Need.create(session[:need])
      @need.required_date  = session[:required_date]
      session[:need] = nil
      session[:required_date] = nil
      generate_need_and_notify(@need)
    else
      session[:previous_url] || root_path
    end
  end


end

