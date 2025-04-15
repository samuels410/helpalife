class OtpController < ApplicationController
  before_action :set_user, only: [:send_otp, :verify]  # Changed to :verify

  # GET /otp/verify - Show OTP entry form
  def new
    @phone_no = session[:phone_no]
    redirect_to new_user_registration_path unless @phone_no.present?
  end

  # POST /otp/send_otp - Send OTP
  def send_otp
    if @user
      @user.generate_otp
      if @user.save
        if SmsService.send_otp(@user.phone_no, @user.otp_code)
          render json: { message: "OTP sent successfully." }, status: :ok
        else
          render json: { error: "Failed to send OTP." }, status: :unprocessable_entity
        end
      else
        render json: { error: "Failed to generate OTP." }, status: :unprocessable_entity
      end
    else
      render json: { error: "User not found." }, status: :not_found
    end
  end

  # POST /otp/verify - Verify OTP
  def verify
    if @user&.verify_otp(params[:otp])
      sign_in(@user)
      session.delete(:phone_no)
      redirect_to root_path, notice: "Successfully logged in!"
    else
      # Changed from otp_new_path to otp_verify_path
      redirect_to otp_verify_path, alert: "Invalid or expired OTP"
    end
  end

  private

  def set_user
    # Changed from params[:phone_no] to session[:phone_no]
    @user = User.find_by(phone_no: session[:phone_no])
    Rails.logger.debug "User found: #{@user.inspect}"
  end
end