module SmsGateway

  class Notifier < ActiveRecord::Base
    API_URL = "https://www.smsgatewayhub.com/api/mt/SendSMS"
    API_KEY = "5ccad4c5-5964-4647-9768-9898699719d1"
    SENDER_ID = "HLPLYF"
    CHANNEL = 2
    DCS = 0
    FLASHSMS = 0

    def self.generate_sms(patient_name, blood_type, date_time, reason, location, contact_number)
      template = "Dear donor, {#var#} needs {#var#} type blood on {#var#} for {#var#} reason at {#var#}. " \
                 "Please respond if you are available for donation. Contact number: {#var#} \n" \
                 "For more details visit www.helpalife.in"

      values = [patient_name, blood_type, date_time, reason, location, contact_number]
      values.each { |value| template.sub!("{#var#}", value) }

      template
    end

    def self.send_donor_request(phone_nos, patient_name, blood_type, date_time, reason, location, contact_number)
      msg = generate_sms(patient_name, blood_type, date_time, reason, location, contact_number)
      send_sms_to_gateway(phone_nos, msg)
    end

    def self.send_sms_to_gateway(phone_nos, msg)
      begin
        uri = URI.parse(API_URL)
        params = {
          APIKey: API_KEY,
          senderid: SENDER_ID,
          channel: CHANNEL,
          number: phone_nos,
          text: msg,
          DCS: DCS,
          Flashsms: FLASHSMS
        }

        Rails.logger.info "🔗 Sending SMS - URL: #{API_URL}, Params: #{params}"

        response = Net::HTTP.post_form(uri, params)

        Rails.logger.info "📩 SMS Gateway Response: Code - #{response.code}, Body - #{response.body}"

        json_response = JSON.parse(response.body)

        if response.code == "200" && json_response["ErrorCode"] == "0"
          Rails.logger.info "✅ SMS sent successfully to #{phone_nos}"
          true
        else
          Rails.logger.error "❌ SMS failed for #{phone_nos}: #{json_response['ErrorMessage']}"
          false
        end
      rescue JSON::ParserError => e
        Rails.logger.error "⚠️ JSON Parsing Error: #{e.message}"
        false
      rescue StandardError => e
        Rails.logger.error "⚠️ Error while sending SMS: #{e.message}"
        false
      end
    end
  end
end
