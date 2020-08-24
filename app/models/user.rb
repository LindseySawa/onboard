class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :messages
  has_one_attached :avatar
  
  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }  #7文字以上
  validates :password_confirmation, presence: true, length: { minimum: 8 } #7文字以上
  validates :fav_country, presence: true
  validates :introduction, presence: true
  mount_uploader :avatar, AvatarUploader
end
