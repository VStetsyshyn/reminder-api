# require_relative "./app/controllers/notification_controller"
class NotificationWorker
  include Sidekiq::Worker

  def perform(*_args)
    p 'Hello World!'
    title = 'ПРИВІТ'
    respon = 'Тато?'
    reg_id = ['reg_id']
    fcm = FcmSend.send_notification(title, respon, reg_id)
    # render json: { Android: fcm }# Do something
  end
end
