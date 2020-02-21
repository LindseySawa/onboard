class Like < ApplicationRecord
  validates :user_id, presence: true, uniqueness: {scope: :post_id}
  validates :post_id, presence: true
  belongs_to :post, counter_cache: :like_count
  belongs_to :user
  # validates_uniqueness_of :post_id, scope: :user_id


end
