FactoryBot.define do
  factory :user do
    username              {"test"}
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"123456"}
    password_confirmation {"123456"}
    follower_id { 1 }
    followed_id { 1 }
  end
end