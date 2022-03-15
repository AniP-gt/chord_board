class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :chords, dependent: :destroy

  has_many :relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :following, through: :relationships, source: :followed
  has_many :reverse_of_relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower


  # has_many :active_relationships,  class_name:  "Relationship",foreign_key: "follower_id",dependent:   :destroy
  # has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent:   :destroy
  # has_many :following, through: :active_relationships,  source: :followed
  # has_many :followers, through: :passive_relationships, source: :follower

  with_options presence: true do
    validates :username
    validates :email
    # validates :password
    # validates :password_confirmation
  end

#　フォローする
def follow(user_id)
  relationships.create(followed_id: user_id)
end

# フォローを解除
def unfollow(user_id)
  relationships.find_by(followed_id: user_id).destroy
end

# フォローしているか判定
def following?(user)
  following.include?(user)
end


  # # ユーザーをフォローする
  # def follow(other_user)
  #   following << other_user
  # end

  # # ユーザーをフォロー解除する
  # def unfollow(other_user)
  #   active_relationships.find_by(followed_id: other_user.id).destroy
  # end

  # # 現在のユーザーがフォローしてたらtrueを返す
  # def following?(other_user)
  #   following.include?(other_user)
  # end


end
