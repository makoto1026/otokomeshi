class Post < ApplicationRecord

  belongs_to :user
  has_many   :comments
  has_many :likes, dependent: :destroy

  validates :title, :body, :material, presence: :true

  mount_uploader :image, ImagesUploader

  def self.search(search)
    return Post.all unless search    
    Post.where('title LIKE(?)', "%#{search}%")
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
   end

end
