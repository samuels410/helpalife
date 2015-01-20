class DonorsController < ApplicationController
  def index
    unless params[:user].nil?
      if (params[:user][:blood_group] != "") and (params[:user][:district_id] == "") and (params[:user][:state_id] == "")
      @users = User.where(blood_group: params[:user][:blood_group]).paginate(page: params[:page], :per_page => 50)

      elsif (params[:user][:blood_group] != "") and (params[:user][:district_id] != "") and (params[:user][:state_id] == "")
        @users = User.where(state_id: params[:user][:district_id],
                            blood_group: params[:user][:blood_group]).paginate(page: params[:page], :per_page => 50)

      elsif (params[:user][:blood_group] == "") and (params[:user][:district_id] != "") and (params[:user][:state_id] != "")
        @users = User.where(district_id: params[:user][:district_id],
                            state_id: params[:user][:state_id]).paginate(page: params[:page], :per_page => 50)

      elsif (params[:user][:blood_group] != "") and (params[:user][:district_id] != "") and (params[:user][:state_id] != "")
        @users = User.where(blood_group: params[:user][:blood_group],
                            district_id: params[:user][:district_id],
                            state_id: params[:user][:state_id]).paginate(page: params[:page], :per_page => 50)

      else
        @users = User.paginate(page: params[:page], :per_page => 50)

      end
    else
      @users = User.paginate(page: params[:page], :per_page => 50)
    end
  end

  def search

  end

end