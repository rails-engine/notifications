FactoryBot.define do
  factory :comment, class: Comment do
    association :user, factory: :user
    association :topic, factory: :topic
    sequence(:body) { |n| "body#{n}" }
  end
end
