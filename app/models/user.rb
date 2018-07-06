class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, 
         :omniauthable, omniauth_providers: %i[facebook]
  
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true , length: { maximum: 255 }
  has_many  :friendships, class_name: "Friendship", foreign_key: 'sender_id'
  has_many  :friends, through: :friendships, source: 'receiver'
  has_many  :friend_requests, class_name: "FriendRequest", foreign_key: 'request_sender'
  has_many  :requests_received, class_name: "FriendRequest", foreign_key: 'request_receiver'
  has_many  :posts, foreign_key: 'author_id', dependent: :destroy
  has_many  :comments, foreign_key: 'author_id', dependent: :destroy
  has_many  :likes, foreign_key: 'author_id', dependent: :destroy
  mount_uploader :profile, PictureUploader


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.remote_profile = auth.info.image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

end


