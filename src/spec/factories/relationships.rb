FactoryBot.define do
  factory :relationship, class:Relationship do
    follower_id    { FactoryBot.create(:user).id }
    followed_id    { FactoryBot.create(:user).id }
  end
end
