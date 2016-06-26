module Notifications
  class NotificationsController < Notifications::ApplicationController
    def index
      @notifications = current_user.notifications.includes(:actor).order('id desc').page(params[:page])

      unread_ids = []
      @notifications.each do |n|
        unread_ids << n.id unless n.read?
      end
      Notification.read!(unread_ids)

      @notification_groups = @notifications.group_by { |note| note.created_at.to_date }
    end

    def clean
      Notification.where(user_id: current_user.id).delete_all
      redirect_to notifications_path
    end
  end
end
