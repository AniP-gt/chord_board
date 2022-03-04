class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :chords, dependent: :destroy
  with_options presence: true do
    validates :username
    validates :email
    validates :password
    validates :password_confirmation
  end
end
