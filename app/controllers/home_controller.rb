class HomeController < ApplicationController

  def index
    @needs = Need.order('created_at DESC').limit(5)
    @users = User.order('created_at DESC').limit(12)
    @search_donor = User.new
    @recent_donors = User.paginate page: params[:page], per_page: 50

  end

  def new_home
    @recent_needs = Need.order('created_at DESC').limit(5)
    @needs = Need.order('created_at DESC').limit(5)
    @users = User.order('created_at DESC').limit(12)
  end

  def about

  end

  def terms

  end

  def vision

  end

end
