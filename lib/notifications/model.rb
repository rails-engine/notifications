module Notifications
  module Model
    extend ActiveSupport::Concern

    DEFAULT_AVATAR = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAMAAAAJixmgAAAAFVBMVEWkpKSnp6eqqqq3t7fS0tLV1dXZ2dmshcKEAAAAtklEQVR4Ae3XsRGAAAjAQFRk/5HtqaTz5H+DlInvAQAAAAAAAAAAAAAAAAAAAACymiveO6o7BQsWLFiwYMGCBS8PFixYsGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBc4IFCxYsWLBgwYIFC14ZfOeAPRQ8IliwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQv+JQAAAAAAAAAAAAAAAAAAAOAB4KJfdHmj+kwAAAAASUVORK5CYII='

    included do
      belongs_to :actor, class_name: Notifications.config.user_class, optional: true
      belongs_to :user, class_name: Notifications.config.user_class

      belongs_to :target, polymorphic: true, optional: true
      belongs_to :second_target, polymorphic: true, optional: true
      belongs_to :third_target, polymorphic: true, optional: true

      scope :unread, -> { where(read_at: nil) }
    end

    def read?
      self.read_at.present?
    end

    def actor_name
      return '' if self.actor.blank?
      self.actor.send(Notifications.config.user_name_method)
    end

    def actor_avatar_url
      return DEFAULT_AVATAR if Notifications.config.user_avatar_url_method.blank?
      return DEFAULT_AVATAR if self.actor.blank?
      self.actor.send(Notifications.config.user_avatar_url_method)
    end

    def actor_profile_url
      return nil if Notifications.config.user_profile_url_method.blank?
      return nil if self.actor.blank?
      self.actor.send(Notifications.config.user_profile_url_method)
    end

    module ClassMethods
      def read!(ids = [])
        return if ids.blank?
        Notification.where(id: ids).update_all(read_at: Time.now)
      end

      def unread_count(user)
        Notification.where(user: user).unread.count
      end
    end
  end
end
