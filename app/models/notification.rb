class Notification < ActiveRecord::Base

  belongs_to :user
  validates :user_id,:notifier_id,:notification_type,:context_type,:context_id,:message  , presence: true

  SMSTYPE ="SMS"

  def self.welcome_sms(user)
    if user.phone_no && !Notification.find_by_context_id_and_context_type_and_workflow_state(user.id,user.class.name,"sent").present?
      msg ="Thank you for registring http://helpalife.in,You have sucessfully joined as a blood donor in our blood donors Community and your blood group is #{user.blood_group.gsub(/[+-]/, "+" => " positive", "-" => " negative")}."
        notification = user.notifications.create(notifier_id: 1 ,notification_type: SMSTYPE,context_type: user.class.name,
                                context_id: user.id,message: msg ,workflow_state: "created")

        url="#{Settings.sms_gateway}?user=#{Settings.sms_user_name}&pwd=#{Settings.sms_password}&to=#{user.phone_no}&sid=#{Settings.sender_id}&msg=#{msg.to_s}&fl=0&gwid=2"
        encoded_url = URI.encode(url)
        puts "url #{url}"
        puts " Encoded #{encoded_url}"
        url = URI.parse(encoded_url)
        req = Net::HTTP::Get.new(url.to_s)
        res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
        }
        logger.info res.body
        notification.update_attributes(workflow_state: "sent")
    else
      logger.info "sms already sent"
      puts "sms already sent"
    end
  end

  end

