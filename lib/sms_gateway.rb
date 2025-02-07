module SmsGateway

  class Notifier < ActiveRecord::Base

    def self.send_sms_to_gateway(phone_nos,msg)

      begin
        full_url = "#{Settings.sms_gateway_url}?APIKey=#{Settings.sms_gateway_api}&senderid=#{Settings.senderid}&channel=#{Settings.channel}&number=#{phone_nos}&text=#{msg}&DCS=#{Settings.dcs}&Flashsms=#{Settings.flashsms}"
        uri = URI.parse(full_url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        request = Net::HTTP::Post.new(uri)
        response = http.request(request)
      rescue => e
          logger.error "error while sending sms"
        end
    end
  end
end
