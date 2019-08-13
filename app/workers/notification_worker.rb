class NotificationWorker
  include Sidekiq::Worker

  def perform(content)
    respon = 'Hello World'
    reg_id = ['reg_id']
    fcm = FcmSendService.send_notification(content, respon, reg_id)
    # render json: { Android: fcm }# Do something
  end
end
