module Notifications
  class NotificationsController < Notifications::ApplicationController
    def index
      @notifications = current_user.notifications.includes(:actor).order('id desc')

      unread_ids = []
      @notifications.each do |n|
        unread_ids << n.id unless n.read?
      end
      Notification.read!(unread_ids)
    end

    def clean
      current_user.notifications.delete_all
    end
  end
end
