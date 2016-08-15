module Api
  class DonorsController < BaseController
    skip_before_action :verify_authenticity_token
    before_action :doorkeeper_authorize!
    def index
      if params[:user].present?
        @donors = User.donors.search(params[:user]).paginate(page: params[:page], per_page: 50)
        respond_with @donors
      else
        @donors = User.donors.paginate page: params[:page], per_page: 50
        respond_with @donors
      end
    end
  end
end
