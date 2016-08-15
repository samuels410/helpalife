class NeedsController < ApplicationController
include NeedsHelper
  def new

  end

  def index
    @needs = Need.order('created_at DESC').paginate(page: params[:page], :per_page => 25)

  end

  def create

    if current_user
      @need = Need.create(need_params)
      @need.required_date  = need_params[:required_date]
    else
      session[:need] = need_params
      session[:required_date] = need_params[:required_date]
      redirect_to new_user_session_path and return
    end
    generate_need_and_notify(@need,true)
  end

  def show
    @need = Need.find(params[:id])
    get_users
    if request.path != need_path(@need)
      redirect_to @need, status: :moved_permanently
    end

  end

  def update
    @need = Need.find(params[:id])
    @need.update_attributes(need_params)
    @need.slug = nil
    @need.perma_link = "#{@need.patient_name}-from-state-#{@need.state.name}-district-#{@need.district.name}-needs-#{@need.blood_group.gsub(/[+-]/, "+" => "-positive", "-" => "-negative")}-blood-on-#{@need.required_date}-for-#{@need.reason}"
    @need.save!
    get_users
    flash[:success] = "The requirement updated"
    redirect_to edit_need_path(@need)
  end

  def edit
    @need = Need.find(params[:id])
  end

  def destroy
    @need = Need.find(params[:id])
    @need.destroy
    flash[:success] = "The requirement removed"
    redirect_to root_path
  end


  def get_users
    @users = User.donors.where(blood_group: @need.blood_group,
                        district_id: @need.district.id,
                        state_id: @need.state.id).paginate(page: params[:page], :per_page => 50)

  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def need_params
    params.require(:need).permit(:required_date,:required_units,:hospital_name,:blood_group,:state_id,
                                 :district_id,:contact_number,:reason,:patient_name,:perma_link)
  end

end
