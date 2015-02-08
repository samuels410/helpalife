class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = current_user.get_activities
  end

end