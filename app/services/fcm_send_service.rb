require 'net/http'
class FcmSendService < ApplicationRecord
  class << self
    def send_notification(title, subtitle, fcm_token)
      ## Android Push Notifiation ##
      data = { registration_ids: fcm_token,
               'data' => {
                 'body' => subtitle,
                 'message' => subtitle,
                 'title' => title
                 # "icon" => "myicon",
                 # "type" => type,
                 # "json_data" => json_details,
                 # "email" => user_email,

               } }

      uri = URI.parse('https://fcm.googleapis.com/fcm/send')
      setup_https(uri).request(post(uri, data))
    end

    private

    def setup_https(uri)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      http
    end

    def post(uri, data)
      post = Net::HTTP::Post.new(uri.path)
      post.body = JSON.generate(data)
      post['Content-Type'] = 'application/json'
      post['Authorization'] = ENV['AUTHORIZATION_ANDROID_KEY']
      post
    end
  end
end
