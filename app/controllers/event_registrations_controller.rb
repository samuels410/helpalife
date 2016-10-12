class EventRegistrationsController < ApplicationController
  layout "events" , except: [:event_dashboard, :save_attachment, :save_video_link]

  def index

  end

  def create

    @user = User.new(name: params[:user][:name],email: params[:user][:email],phone_no: params[:user][:phone_no],
                    is_donor: params[:user][:is_donor], password: params[:user][:password],
                    state_id: params[:user][:state_id], district_id: params[:user][:district_id],
                    blood_group: params[:user][:blood_group])

    @user.build_participant(college_name: params[:user][:participants][:college_name],
                            event_name: params[:user][:participants][:event_name])
    if params[:user][:is_donor] == "0"
      @user.skip_blood_group_validation = true
      @user.skip_state_id_validation = true
      @user.skip_district_id_validation = true
    end

    if @user.save
      flash[:success] = "Thank you for registering DEFINE YOUNG INDIA. INSPIRE THE NATION contest! This is your dashboard
                          here you can upload your contest material"
      NotificationMailer.delay.event_registration_confirmation(@user,request.protocol,request.host_with_port)
      if @user.is_donor
         NotificationMailer.delay.welcome(@user,request.protocol,request.host_with_port)
         Notification.delay.welcome_sms(@user)
      end
      sign_in(:user, @user)
      redirect_to event_dashboard_path
    else
      flash[:success] = "There is some error while processing your request"
      render :action => 'index', :anchor => "register"
    end
  end

  def event_dashboard
    unless current_user
      @participants = Participant.all
      redirect_to new_user_session_path and return
    end

  end

  def save_attachment
    participant = current_user.participant
    participant.attachment = params[:participant][:attachment]
    if participant.save
      flash[:success] = "You have successfully submitted your content"
      redirect_to event_dashboard_path
    else
      render :event_dashboard
    end
  end

  def save_video_link
    participant = current_user.participant
    participant.video_link = params[:participant][:video_link]
    if participant.save && participant.video_link.present?
      flash[:success] = "You have successfully submitted your content"
      redirect_to event_dashboard_path
    else
      flash[:error] = "Please provide a valid link"
      render :event_dashboard
    end
  end


end
