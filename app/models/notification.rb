class Notification < ActiveRecord::Base
 include SmsGateway
  belongs_to :user
  validates :user_id,:notifier_id,:notification_type,:context_type,:context_id,:message  , presence: true

  SMSTYPE ="SMS"

  def self.welcome_sms(user)
    if user.phone_no && !Notification.find_by(context_id: user.id, context_type: user.class.name, workflow_state: "sent").present?
      msg = "Thank you for registering www.helpalife.in. You have successfully joined as a blood donor and your blood group is #{user.blood_group.gsub('+', ' positive').gsub('-', ' negative')}."
      notification = user.notifications.create(notifier_id: 1 ,notification_type: SMSTYPE,context_type: user.class.name,
                                               context_id: user.id,message: msg ,workflow_state: "created")
      Notifier.send_sms_to_gateway(user.phone_no,msg,"#{Settings.sign_up_template_id}")
      notification.update_attributes(workflow_state: "sent")
    else
      logger.info "sms already sent"
      puts "sms already sent"
    end
  end

  def self.send_sms(phone_nos,msg)
    SmsGateway::Notifier.send_sms_to_gateway(phone_nos,msg,"#{Settings.specific_bloodgroup_donor}")
  end

end