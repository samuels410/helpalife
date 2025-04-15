class RegistrationsController < Devise::RegistrationsController
  before_action :find_user, only: [:send_otp, :verify_otp]

  def new
    build_resource # Devise method to initialize a new user
    @user = resource # Makes @user available in the view
  end
  def send_otp
    if @user
      @user.generate_otp!
      SmsService.send_otp(@user.phone_no, @user.otp_code)
      session[:phone_no] = @user.phone_no
      redirect_to otp_new_path, notice: "OTP sent successfully."

    else
      redirect_to new_user_registration_path, alert: "User not found."
    end
  end

  def verify_otp
    if @user&.verify_otp(params[:otp])
      sign_in(@user)
      redirect_to root_path, notice: "OTP verified successfully!"
    else
      # Remove phone_no from redirect parameters
      redirect_to otp_new_path, alert: "Invalid OTP. Please try again."
    end
  end

  private

  def account_update_params
    params.require(:user).permit(
      :name, :email, :password, :password_confirmation, :current_password,
      :phone_no, :blood_group, :state_id, :district_id, :is_donor, :terms_of_service
    )
  end

  def find_user
    @user = User.find_by(phone_no: params[:phone_no])
  end

  def generate_otp!
    self.otp_code = rand(100000..999999) # Generate 6-digit OTP
    self.otp_sent_at = Time.current
    save!
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