class NotificationController < ApplicationController
  def notification_check
    title = 'ПРИВІТ'
    respon = 'Тато?'
    reg_id = params['reg_id']
    fcm = FcmSend.send_notification(title, respon, reg_id)
    render json: { Android: fcm }
end
end
