class CollegesController < ApplicationController
  def index
    @colleges = College.all.includes(:college_emails,:college_contact_details)
  end

  def import
    College.import(params[:file])
    redirect_to root_url, notice: "college list imported."
  end
end
