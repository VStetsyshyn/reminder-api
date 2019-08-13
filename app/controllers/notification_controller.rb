class NotificationController < ApplicationController
  def notification_check
    #     title = 'ПРИВІТ'
    #     respon = 'Тато?'
    #     reg_id = params['reg_id']
    #     fcm = FcmSend.send_notification(title, respon, reg_id)
    #     render json: { Android: fcm }
    # end
    t = Time.new(2019, 8, 13, 21, 27).to_time

    NotificationWorker.perform_at(t)
end
end
