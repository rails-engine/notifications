class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  after_create :create_notifications
  def create_notifications
    Notification.create(
      notify_type: 'comment',
      actor: self.user,
      target: self,
      second_target: self.topic,
      user_id: self.topic.user_id
    )
  end
end
