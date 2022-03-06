FactoryBot.define do
  factory :relationship do
    username              {"test"}
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"123456"}
    password_confirmation {"123456"}
    sequence(:follower_id) { n }
    sequence(:followed_id) { n }
  end
end
