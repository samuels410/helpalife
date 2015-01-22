# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  notification_type :string(255)
#  user_id           :integer
#  notifier_id       :integer
#  context_type      :string(255)
#  context_id        :integer
#  message           :text
#  workflow_state    :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  ref_id            :text
#

class Notification < ActiveRecord::Base
 include SmsGateway
  belongs_to :user
  validates :user_id,:notifier_id,:notification_type,:context_type,:context_id,:message  , presence: true

  SMSTYPE ="SMS"

  def self.welcome_sms(user)
    if user.phone_no && !Notification.find_by_context_id_and_context_type_and_workflow_state(user.id,user.class.name,"sent").present?
      msg ="Thank you for registring http://helpalife.in,You have sucessfully joined as a blood donor in our blood donors Community and your blood group is #{user.blood_group.gsub(/[+-]/, "+" => " positive", "-" => " negative")}."
      notification = user.notifications.create(notifier_id: 1 ,notification_type: SMSTYPE,context_type: user.class.name,
                                               context_id: user.id,message: msg ,workflow_state: "created")
      Notifier.send_sms_to_gateway(user.phone_no,msg)
      notification.update_attributes(workflow_state: "sent")
    else
      logger.info "sms already sent"
      puts "sms already sent"
    end
  end

  def self.send_sms(phone_nos,msg)
    Notifier.send_sms_to_gateway(phone_nos,msg)
  end

  end

