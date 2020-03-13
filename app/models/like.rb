class Like < ApplicationRecord
  belongs_to :post, counter_cache: :likes_count
  belongs_to :user
 
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates_uniqueness_of :post_id, scope: :user_id

end
