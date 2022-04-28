class Chord < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :user_id
    validates :title , length: { maximum: 30 }
    validates :body , length: { maximum: 140 }
    validates :work
  end
end
