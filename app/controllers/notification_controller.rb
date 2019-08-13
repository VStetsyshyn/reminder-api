class NotificationController < ApplicationController
  def notification_check(time)
    #     title = 'ПРИВІТ'
    #     respon = 'Тато?'
    #     reg_id = params['reg_id']
    #     fcm = FcmSend.send_notification(title, respon, reg_id)
    #     render json: { Android: fcm }
    # end
    time = time.to_datetime

    NotificationWorker.perform_at(time)
end
end
