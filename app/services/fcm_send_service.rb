require 'net/http'
class FcmSendService < ApplicationRecord
  class << self
    def send_notification(title, respon, reg_id)
      ## Android Push Notifiation ##
      reg_id = ['dRn5NMDs014:APA91bG17btX87uvOu1WPHGL4SDUJlDxrBsNnKYgLE6MsBgYOW4_YEFFxjYRiR_8s-wRu9WhxpEfUqDJ96guGA2BieyFWeKwhyCuZDb2aDxbmq__krlbyfOZfDAgzYvhBemofL8OlCRs']
      data = { :registration_ids => reg_id,
               'data' => {
                 'body' => respon,
                 'message' => respon,
                 'title' => title
                 # "icon" => "myicon",
                 # "type" => type,
                 # "json_data" => json_details,
                 # "email" => user_email,

               } }

      uri = URI.parse('https://fcm.googleapis.com/fcm/send')

      response = setup_https(uri).request(post(uri, data))
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
      binding.pry
      post['Authorization'] = ENV['AUTHORIZATION_ANDROID_KEY']
      post
    end
  end
end
