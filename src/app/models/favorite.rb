class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :chord
  with_options presence: true do
    validates :user_id
    validates :chord_id
  end
end
