module SmsGateway

class Notifier < ActiveRecord::Base

  def self.send_sms_to_gateway(phone_nos,msg)
    begin
      uri = URI.parse(Settings.sms_gateway)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      path = uri.path
      data = "to=#{phone_nos}&msg=#{msg}"
      headers = {
          'Authorization' => "Token token=#{Settings.sms_gateway_api}"
      }
      resp, data = http.post(path, data, headers)
    rescue => e
      logger.error "error while sending sms"
      ignored
    end
  end

  end
end