class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :messages
  validates :email, presence: true
  validates :username, presence: true
  validates :fav_country, presence: true
  validates :introduction, presence: true
  validates :username, uniqueness: true
end
