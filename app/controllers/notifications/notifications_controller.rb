module Notifications
  class NotificationsController < Notifications::ApplicationController
    def index
      @notifications = notifications.includes(:actor).order("id desc").page(params[:page])
      @notification_groups = @notifications.group_by { |note| note.created_at.to_date }

      unread_ids = @notifications.unread.ids
      Notification.read!(current_user, unread_ids)
    end

    def read
      Notification.read!(current_user, params[:ids])
      render json: { ok: 1 }
    end

    def clean
      notifications.delete_all
      redirect_to notifications_path
    end

    private
      def notifications
        raise "You need reqiure user login for /notifications page." unless current_user
        Notification.where(user_id: current_user.id)
      end
  end
end
