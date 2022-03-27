FactoryBot.define do
  factory :user do
    username              {"太郎"}
    email                 { "test@example.com" }
    password              {"123456"}
    password_confirmation {"123456"}
    follower_id           { 1 }
    followed_id           { 1 }
  end
end