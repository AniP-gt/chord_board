class Chord < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :title
    validates :body
    validates :work
  end
end
