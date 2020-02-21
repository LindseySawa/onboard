class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments
  has_many :likes, dependent: :destroy

  # def like_user(user_id)
  #   likes.find_by(user_id: user_id)
  # end

  mount_uploader :image, ImageUploader

  def self.search(search)
    return Post.all() unless search
    Post.where('title LIKE(?) OR country LIKE(?) OR city LIKE(?) OR how LIKE(?) OR discription LIKE(?)',"%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
    # Post.where('city LIKE(?) OR discription LIKE(?)',"%#{search}%","%#{search}%")
    # Post.join(:countries).where('countries.name LIKE(?)',"%#{search}%")
    # Post.join(:countries).where('post.city LIKE(?) OR post.discription LIKE(?) OR countries_id LIKE(?)',"%#{search}%","%#{search}%","%#{search}%").references(:countries)
  end
  
end
