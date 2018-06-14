require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @friendship = Friendship.new(sender: users(:user1),
                                 receiver: users(:user2))
    FriendRequest.create(sender: users(:user1),
                         receiver: users(:user2))
  end

  test "should be valid" do
    assert @friendship.valid?
  end

  test "should require a sender" do
    @friendship.sender = nil
    assert_not @friendship.valid?
  end

  test "should require a receiver" do
    @friendship.receiver = nil
    assert_not @friendship.valid?
  end

  test "creates a mirror friendship" do
    @friendship.save
    @mirror_friendship = Friendship.find_by(sender: users(:user2),
                                            receiver: users(:user1))
    assert @mirror_friendship
  end

  test "destroy friend request after creating the friendship" do
    assert FriendRequest.find_by(sender: users(:user1),
                                 receiver: users(:user2))
    @friendship.save
    assert_not FriendRequest.find_by(sender: users(:user1),
                                     receiver: users(:user2))
  end 
end
