class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: "sender_id"
  belongs_to :receiver, class_name: 'User', foreign_key: "receiver_id"
  after_create :delete_friend_request, :mirror_friendship

  def delete_friend_request
    @request = FriendRequest.find_by(sender: self.sender_id, 
                                     receiver: self.receiver_id)
    @request.destroy unless @request.nil?
  end

  def mirror_friendship
    unless Friendship.find_by(sender: self.receiver_id,
                              receiver: self.sender_id)
      Friendship.create(sender: self.receiver,
                        receiver: self.sender)
    end
  end 
end
