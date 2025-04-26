class RegistrationsController < Devise::RegistrationsController
  before_action :find_user, only: [:send_otp, :verify_otp]

  def create
    build_resource(account_update_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      Rails.logger.error "USER REGISTRATION ERRORS: #{resource.errors.full_messages.join(", ")}"
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end


  def new
    build_resource # Devise method to initialize a new user
    @user = resource # Makes @user available in the view
  end

  private

  def account_update_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :current_password,
      :phone_no, :blood_group, :state_id, :district_id, :is_donor, :terms_of_service
    )
  end

  def find_user
    @user = User.find_by(phone_no: session[:phone_no])
  end

  def otp_form
    @phone_no = session[:phone_no]
    @user = User.find_by(phone_no: @phone_no)
  end

  def after_sign_up_path_for(resource)
    session[:phone_no] = resource.phone_no
    otp_verify_path  # Changed from otp_new_path to otp_verify_path
  end

  def update
    @user = User.find(current_user.id)
    successfully_updated = if needs_password?(@user, params)
                             @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
                           else
                             params[:user].delete(:current_password)  # Remove unnecessary param
                             @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
                           end

    if successfully_updated
      Notification.welcome_sms(@user)
      set_flash_message :notice, :updated
      sign_in @user, bypass: true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  private

  def needs_password?(user, params)
    user.email != params[:user][:email] || params[:user][:password].present?
  end
end