class Post < ApplicationRecord

  belongs_to :user
  has_many   :comments

  validates :title, :body, :material, presence: :true


  mount_uploader :image, ImagesUploader
end
