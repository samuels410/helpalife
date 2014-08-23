class NotificationMailer < ActionMailer::Base
  default from: "info@helpalife.in"

  def notify_need(user,need)
    @user = user
    @need = need
    @url  = need_url(need)
    mail(to: @user.email, subject: "#{need.patient_name}, Needs #{need.blood_group} blood.")
  end

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to http://helpalife.in")
  end

  def contact_email(name,message,from_email,subject)
    @name = name
    @message = message
    mail(to: "samuels410@gmail.com", from: from_email, subject: subject)
  end


end
