class Post < ApplicationRecord

  belongs_to :user
  has_many   :comments

  def self.search(search)
    return Post.all unless search    
    Post.where('title LIKE(?)', "%#{search}%")
  end

  validates :title, :body, :material, presence: :true

  mount_uploader :image, ImagesUploader
end
