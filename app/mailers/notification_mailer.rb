class NotificationMailer < ActionMailer::Base
  default from: "contact@helpalife.in"

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


end
