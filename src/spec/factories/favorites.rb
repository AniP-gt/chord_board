FactoryBot.define do
  factory :favorite, class:Favorite do
    user_id { FactoryBot.create(:user).id }
    chord_id { FactoryBot.create(:chord).id }
  end
end
