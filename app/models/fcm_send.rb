class FcmSend < ApplicationRecord
  ## Android Push Notifiation ##
  def self.send_notification(title, respon, reg_id)
    reg_id = ['dNBke5pyzwc:APA91bEFPalGNZrlXlVVuISk5MezB6gxfrMudEll19IZfhywBX-_0o5obL9wZ4vr0yRe1VnJ0tnM7AoG-UozIq-MRF-bc3XJo0gZ5s5ySLKuO7v982x0ZaoYxL0703_H4l3u7gKziD4q']
    res1 = ''
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
    require 'net/http'
    req = Net::HTTP.new(uri.host, uri.port)
    req1 = Net::HTTP::Post.new(uri.path)
    req.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req.use_ssl = true
    req1.body = JSON.generate(data)
    req1['Content-Type'] = 'application/json'
    ##-- Authorization key for android --##
    req1['Authorization'] = 'key=AAAAaGQ_q2M:APA91bGCEOduj8HM6gP24w2LEnesqM2zkL_qx2PJUSBjjeGSdJhCrDoJf_WbT7wpQZrynHlESAoZ1VHX9Nro6W_tqpJ3Aw-A292SVe_4Ho7tJQCQxSezDCoJsnqXjoaouMYIwr34vZTs'
    res = req.request(req1)
    res.each do |val|
      res1 << val
    end
    # hash = Hash.new
    # hash["res"] = JSON.parse(res.body)
    # hash["reg_id"] = reg_id
    # return hash
  end
end
