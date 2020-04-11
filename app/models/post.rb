class Post < ApplicationRecord

  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  belongs_to :user,     foreign_key: 'user_id'
  belongs_to :category, foreign_key: 'category_id'

  validates :title,    presence: true, ngword: true
  validates :body,     presence: true, ngword: true
  validates :material, presence: true, ngword: true

  mount_uploader :image, ImagesUploader

  def self.search(search)
    return Post.all unless search    
      Post.where('title LIKE(?) OR body LIKE(?) OR material LIKE(?)', "%#{search}%","%#{search}%","%#{search}%")    
  end

end

