class NeedsController < ApplicationController

  def new

  end

  def index
    @needs = Need.order('created_at DESC').paginate(page: params[:page], :per_page => 25)

  end

  def create
    @need = Need.create(need_params)
    @need.required_date  = need_params[:required_date]
    @need.user_id = current_user.id
    @need.perma_link = "#{@need.patient_name}-from-state-#{@need.state.name}-district-#{@need.district.name}-needs-#{@need.blood_group.gsub(/[+-]/, "+" => "-positive", "-" => "-negative")}-blood-on-#{@need.required_date}-for-#{@need.reason}"
    if @need.save!
      @users = User.email_notification_enabled.where(blood_group: @need.blood_group,
                                                     district_id: @need.district.id,
                                                     state_id: @need.state.id)
      @users.each do |user|
        NotificationMailer.delay.notify_need(user,@need)
      end
      @sms_users = User.sms_notification_enabled.phone_not_empty.where(blood_group: @need.blood_group,
                                                     district_id: @need.district.id,
                                                     state_id: @need.state.id)

      phone_nos = @sms_users.collect(&:phone_no)
      msg = "#{@need.patient_name.capitalize} needs, #{@need.required_units} units of #{@need.blood_group} blood ,on #{@need.required_date}. Phone no: #{@need.contact_number}, Hospital: #{@need.hospital_name} ,From #{@need.state.name},#{@need.district.name}. Visit, http://helpalife.in"
      phone_nos.each_slice(100) do |hundred_user_phones|
        Notification.send_sms(hundred_user_phones.join(","),msg)
        logger.info("Assigning:#{hundred_user_phones.join(",")} sms")
      end

      flash[:success] = "Your need is posted and email notifications sent to the below donors!"
       redirect_to need_path(@need)
    end
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
    @users = User.where(blood_group: @need.blood_group,
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
