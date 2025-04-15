require 'net/http'
require 'uri'
require 'json'

class SmsService
  API_URL = Settings.sms_gateway_url
  API_KEY = Settings.sms_api_key
  SENDER_ID = Settings.sms_sender_id
  CHANNEL = 2
  DCS = 0
  FLASH_SMS = 0

  def self.send_sms(phone_number, message)
    uri = URI(API_URL)

    params = {
      apikey: API_KEY,
      senderid: SENDER_ID,
      channel: CHANNEL,
      DCS: DCS,
      flashsms: FLASH_SMS,
      number: phone_number,
      text: message,
      route: 1
    }

    puts "📩 Sending SMS with Params: #{params.inspect}" # Debugging output

    begin
      # Convert hash to URL-encoded format
      uri.query = URI.encode_www_form(params)

      response = Net::HTTP.get_response(uri) # GET request instead of POST

      if response.is_a?(Net::HTTPSuccess)
        json_response = JSON.parse(response.body)
        puts "✅ SMS API Response: #{json_response}"
        return json_response
      else
        puts "❌ SMS API Error: HTTP #{response.code} - #{response.message}"
        return nil
      end
    rescue JSON::ParserError => e
      puts "❌ SMS JSON Parse Error: #{e.message} - Response: #{response.body}"
      return nil
    rescue StandardError => e
      puts "❌ SMS Error: #{e.message}"
      return nil
    end
  end

  def self.send_otp(phone_number, otp)
    message = "Dear donor, #{otp} is the OTP for your phone number verification at www.helpalife.in. In case you have not requested this, please ignore."
    send_sms(phone_number, message)
  end
end
