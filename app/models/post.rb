class Post < ApplicationRecord

  belongs_to :user, foreign_key: 'user_id'
  has_many   :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :category
  validates :title, :body, :material, presence: :true

  mount_uploader :image, ImagesUploader

  def self.search(search)
    return Post.all unless search    
    Post.where('title LIKE(?)', "%#{search}%")
  end



end
