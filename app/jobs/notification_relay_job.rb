class NotificationRelayJob < ApplicationJob
  queue_as :default

  def perform(notification)
    # Do something later
    html = ApplicationController.render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
    ActionCable.server.broadcast "notifications:#{notification.recipient_id}", notification: html
  end
end
