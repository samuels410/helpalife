class CollegesController < ApplicationController
  def index

  end

  def import
    College.import(params[:file])
    redirect_to root_url, notice: "college list imported."
  end
end
