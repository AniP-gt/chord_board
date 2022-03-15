class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  with_options presence: true do
    validates :followed_id
    validates :follower_id
  end

  def change
  end
end
