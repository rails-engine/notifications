FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user-#{n}@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
