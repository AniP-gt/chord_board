class Chord < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  with_options presence: true do
    validates :user_id
    validates :title , length: { maximum: 30 }
    validates :body , length: { maximum: 140 }
    validates :work
  end

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
