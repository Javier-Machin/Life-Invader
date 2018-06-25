class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many   :comments
  has_many   :likes, as: :likeable
  mount_uploader :picture, PictureUploader
  validates  :content, presence: true , length: { maximum: 800 }
end
