class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  has_many   :likes,  dependent: :delete_all, as: :likeable
  validates  :content, presence: true , length: { maximum: 450 }
end
