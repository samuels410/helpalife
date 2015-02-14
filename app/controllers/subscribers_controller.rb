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
    @subscriber.subscribed_for ="2015 ICC India Vs Pakistan"
    @subscriber.phone.to_s
    if @subscriber.save
      msg = "You have subscribed to receive #{@subscriber.subscribed_for} Live Free update. Visit http://helpalife.in for Post Blood Request and get donors details."
      Notifier.delay.send_sms_to_gateway(@subscriber.phone,msg)
      flash[:info] = 'You have successfully subscribed to receive ICC 2015 India vs Pakistan Free Live Update.'
      redirect_to root_url
    else
      render 'index'
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def permitted_params
    params.require(:subscriber).permit(:phone)
  end


end
