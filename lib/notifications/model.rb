module Notifications
  module Model
    extend ActiveSupport::Concern

    included do
      belongs_to :actor, class_name: Notifications.config.user_class
      belongs_to :user, class_name: Notifications.config.user_class

      belongs_to :target, polymorphic: true
      belongs_to :second_target, polymorphic: true
      belongs_to :third_target, polymorphic: true
    end

    def read?
      self.read_at.present?
    end
  end
end
