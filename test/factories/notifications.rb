FactoryBot.define do
  factory :notification, class: Notification do
    association :user, factory: :user
    association :actor, factory: :user
    notify_type 'follow'
  end
end
