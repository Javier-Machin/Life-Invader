class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many   :comments
  has_many   :likes, as: :likeable
  mount_uploader :picture, PictureUploader
  validates  :content, presence: true , length: { maximum: 800 }
  validate   :picture_size


  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 2.megabytes
        errors.add(:picture, "should be less than 2MB")
      end
    end
end
