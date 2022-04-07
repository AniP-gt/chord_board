class Chord < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :user_id
    validates :title
    validates :body
    validates :work
  end
end
