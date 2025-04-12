class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(email: params[:user][:email])

    if user && !user.otp_verified?
      redirect_to otp_new_path, alert: "Please verify your OTP before logging in."
    else
      super
    end
  end

  # Custom sign-out handling
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    yield if block_given?
    respond_to_on_destroy
  end

  private

  # Redirect after sign-out
  def respond_to_on_destroy
    redirect_to root_path
  end
end
