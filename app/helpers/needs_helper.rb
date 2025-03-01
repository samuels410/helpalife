module NeedsHelper
  def generate_need_and_notify(need,redirect=nil)
    need.user_id = current_user.id
    need.perma_link = "#{need.patient_name}-from-state-#{need.state.name}-district-#{need.district.name}-needs-#{need.blood_group.gsub(/[+-]/, "+" => "-positive", "-" => "-negative")}-blood-on-#{need.required_date}-for-#{need.reason}"
    if need.save!
      @users = User.email_notification_enabled.where(blood_group: need.blood_group,
                                                     district_id: need.district.id,
                                                     state_id: need.state.id)
      @users.each do |user|
        NotificationMailer.delay.notify_need(user,need)
      end
      @sms_users = User.sms_notification_enabled.phone_not_empty.where(blood_group: need.blood_group,
                                                                       district_id: need.district.id,
                                                                       state_id: need.state.id)

      phone_nos = @sms_users.collect(&:phone_no)
      msg = "Dear donor, #{need.patient_name.capitalize} needs #{need.blood_group.gsub('+', ' positive').gsub('-', ' negative')} type blood on #{need.required_date} for #{need.reason} reason at #{need.hospital_name}. Please respond if you are available for donation. Contact number: #{need.contact_number}.\n For more details visit www.helpalife.in"
      phone_nos.each_slice(100) do |hundred_user_phones|
        Notification.send_sms(hundred_user_phones.join(","),msg)
        logger.info("Assigning:#{hundred_user_phones.join(",")} sms")
      end

      flash[:success] = "Your requirement is posted and notifications sent to the below donors!"
      if redirect
        redirect_to need_path(need)
      else
        need_path(need)
      end
    end
  end
end
