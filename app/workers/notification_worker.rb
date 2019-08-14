class NotificationWorker
  include Sidekiq::Worker

  def perform(content, fcm_token)
    subtitle = 'Reminder'
    fcm_token_array = []
    fcm_token_array << fcm_token
    FcmSendService.send_notification(content, subtitle, fcm_token_array)
  end
end
