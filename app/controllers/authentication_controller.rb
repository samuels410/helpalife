class AuthenticationController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    provider = set_provider(auth)
    authentication = Authentication.find_by_provider_and_uid(provider, auth['uid'])
    if authentication
      flash[:info] = "Welcome. #{authentication.user.try(:name)}"
      sign_in_and_redirect(:user, authentication.user)
    else
      email = auth['info']['email']
      user = User.find_by_email(email)
      user ||= User.new
      user.apply_omniauth(auth)
      if user.save(:validate => false)
        flash.now[:notice] = "Account created and signed in successfully."
        sign_in(:user, user)
        redirect_to edit_user_registration_path
      else
        flash.now[:error] = "Error while creating a user account. Please try again."
        redirect_to root_url
      end
    end
  end

  def auth_failure
    flash[:error] = params[:message]
    redirect_to root_url
  end

  def set_provider(auth)
    if auth['provider'] == "google_oauth2"
      provider = "Google"
    else
      provider = auth['provider']
    end
  end



end
