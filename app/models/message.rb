class Message < ApplicationRecord
  validates :email, presence: true, length: {maximum:255},
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :message, presence: true
  belongs_to :users
end
