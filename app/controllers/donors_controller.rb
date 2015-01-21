class DonorsController < ApplicationController
  def index
    @donors = User.paginate page: params[:page], per_page: 50
  end

  def search
    donor = User.search(params[:users])
    @donors = User.paginate page: params[:page], per_page: 50
    render :index
  end

end