class SubscribersController < ApplicationController
  include SmsGateway
  def index
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(permitted_params)
    unless @subscriber.phone.is_a? Numeric
      @subscriber.errors.add(:base, "Only ten digit phone number only accepted")
    end
    @subscriber.subscribed_for ="2015 ICC World Cup"
    @subscriber.phone.to_s
    if @subscriber.save
      msg = "You have subscribed to receive #{@subscriber.subscribed_for} Live Free update. Visit http://helpalife.in for Post Blood Request and get donors details."
      Notifier.delay.send_sms_to_gateway(@subscriber.phone,msg)
      flash[:info] = 'You have successfully subscribed to receive 2015 ICC World Cup Free Live Update.'
      redirect_to root_url
    else
      render 'index'
    end
  end

  def new
   if signed_in? & current_user.has_role?(:admin)
     @subscriber = Subscriber.new
   else
     flash[:error] = "Access denied"
     redirect_to root_url
   end
  end

  def subscription_message
    @subscribers = Subscriber.subscribed
    phone_nos = @subscribers.collect(&:phone)
    msg = params[:subscriber][:message]
    msg += "Sponsored by http://helpalife.in"
    phone_nos.each_slice(100) do |hundred_user_phones|
      Notifier.delay.send_sms_to_gateway(hundred_user_phones.join(","),msg)
      logger.info("Assigning:#{hundred_user_phones.join(",")} sms")
    end
    flash[:info] ="SMS sent to #{@subscribers.size} subscribers"
    redirect_to new_subscriber_path
  end

  def unsubscribe_sms
    @subscriber = Subscriber.new
  end

  def unsubscribe
    @subscriber = Subscriber.find_by_phone(params[:subscriber][:phone])
    if @subscriber
      @subscriber.workflow_state="unsubscribe"
      @subscriber.save
      flash[:info] = "You have successfully unsubscribed"
    else
      flash[:info] = "No subscriber found"
    end
    redirect_to root_url
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def permitted_params
    params.require(:subscriber).permit(:phone,:message)
  end


end
