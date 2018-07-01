class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true
  belongs_to :author, class_name: 'User', foreign_key: 'author_id' 
  validates  :author_id, uniqueness: { scope: [:likeable_id, :likeable_type] }
end
