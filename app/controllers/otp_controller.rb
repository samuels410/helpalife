class OtpController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:send_otp, :verify_otp]
  before_action :set_user, only: [:send_otp, :verify_otp]

  def new
    @phone_no = params[:phone_no]
  end

  # Send OTP to User's Phone
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

  def verify
    @user = User.find_by(phone_no: params[:phone_no])

    if @user&.verify_otp(params[:otp])
      sign_in(@user)
      # Clear any existing OTP-related session data here if needed
      redirect_to root_path, notice: "Successfully logged in!"
    else
      redirect_to otp_new_path(phone_no: params[:phone_no]),
                  alert: "Invalid or expired OTP"
    end
  end


  private

  def set_user
    Rails.logger.debug "Finding user with phone_no: #{params[:phone_no]}"
    @user = User.find_by(phone_no: params[:phone_no])
    Rails.logger.debug "User found: #{@user.inspect}"
  end

end