class Api::DonorsController < Api::ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @donors = User.paginate page: params[:page], per_page: 50
    respond_with @donors
  end

  def search
    @donors = User.search(params[:user]).paginate(page: params[:page], per_page: 50)
    respond_with @donors
  end
end
