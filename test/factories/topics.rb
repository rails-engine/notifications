FactoryBot.define do
  factory :topic, class: Topic do
    association :user, factory: :user
    sequence(:title) { |n| "title#{n}" }
  end
end
