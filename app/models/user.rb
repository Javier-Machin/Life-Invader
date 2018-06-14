class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true , length: { maximum: 255 }
  has_many :friendships, class_name: "Friendship", foreign_key: 'sender_id'
  has_many :friends, through: :friendships, source: 'receiver'
  has_many :friend_requests, class_name: "FriendRequest", foreign_key: 'request_sender'
  has_many :requests_received, class_name: "FriendRequest", foreign_key: 'request_receiver'
end
