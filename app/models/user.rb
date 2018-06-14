class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :friendships, class_name: "Friendship", foreign_key: 'sender_id'
  has_many :friends, through: :friendships, source: "receiver"
end
