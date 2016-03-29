class Topic < ActiveRecord::Base
  belongs_to :user

  after_create :create_notifications
  def create_notifications
    User.all.each do |u|
      Notification.create(
        notify_type: 'new_topic',
        actor: self.user,
        target: self,
        user_id: u.id
      )
    end
  end
end
