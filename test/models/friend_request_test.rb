require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @friendrequest = FriendRequest.new(sender:   users(:user1),
                                       receiver: users(:user2))
  end

  test "should be valid" do
    assert @friendrequest.valid?
  end

  test "should require a sender" do
    @friendrequest.sender = nil
    assert_not @friendrequest.valid?
  end

  test "should require a receiver" do
    @friendrequest.receiver = nil
    assert_not @friendrequest.valid?
  end

  test "should not allow to send more than one request to each user" do
    samerequest = @friendrequest.dup
    @friendrequest.save
    assert_not samerequest.valid?
  end

  test "users can receive many requests if the sender is different" do
    @friendrequest.save
    other_request = FriendRequest.new(sender:   users(:user3),
                                      receiver: users(:user2))
    assert other_request.valid?
  end

end
