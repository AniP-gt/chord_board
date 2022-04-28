FactoryBot.define do
  factory :user, class: User  do
    # username              {"太郎"}    
    sequence(:username) { |n| "テストユーザー#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password              {"123456"}
    password_confirmation {"123456"}
    confirmed_at          {Time.zone.now}

    trait :test_user do
      username              {"三郎"}
      email                 { "test20@example.com" }
      after(:create) {|user| user.confirmed_at}
    end

    trait :test_user2 do
      username              {"四郎"}
      email                 { "test30@example.com" }
    end
  end

end