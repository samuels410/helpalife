class DonorsController < ApplicationController
  def index
    @donors = User.paginate page: params[:page], per_page: 50
    @filter_donor = User.new
  end

  def search
    @filter_donor = User.new user_params
    # users = User.filter params[:user]
    @donors = User.filter(params[:user]).paginate(page: params[:page], per_page: 50)
    render :index
  end

  private

  def user_params
    params.require(:user).permit(:blood_group, :state_id, :district_id)
  end

end