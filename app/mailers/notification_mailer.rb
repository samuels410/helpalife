class NotificationMailer < ActionMailer::Base
  default from: "notifier@life-donors.com"

  def notify_need(user,need)
    @user = user
    @need = need
    @url  = need_url(need)
    mail(to: @user.email, subject: "#{need.patient_name}, Needs #{need.blood_group} blood.")
  end


end
