class OtpController < ApplicationController
  before_action :set_user, only: [:send_otp, :verify]  # Changed to :verify
  before_action :validate_session, only: [:send_otp, :verify]

  # GET /otp/verify - Show OTP entry form
  def new
    @phone_no = session[:phone_no]
    redirect_to new_user_registration_path unless @phone_no.present?
  end

  # POST /otp/send_otp - Send OTP
  def send_otp
    if @user
      @user.generate_otp
      @user.otp_sent_at = Time.current
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
    user = User.find_by(phone_no: params[:phone_no])
    if user && user.otp_code == params[:otp] && user.otp_expires_at > Time.current
      user.update(otp_verified: true)  # 👈 mark as verified
      sign_in(user) # if you're using Devise
      redirect_to root_path, notice: "OTP verified successfully!"
    else
      flash[:alert] = "Invalid or expired OTP"
      redirect_to otp_verify_path
    end
  end

  private

  def set_user

    @user = User.find_by(phone_no: session[:phone_no])
    Rails.logger.info "Session phone_no: #{session[:phone_no]}, User found: #{@user&.phone_no}"
  end

  def validate_session
    unless session[:phone_no].present?
      redirect_to new_user_registration_path, alert: "Session expired. Please sign up again."
    end
  end
end