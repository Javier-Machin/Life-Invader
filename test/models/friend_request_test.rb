require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @friendrequest = FriendRequest.new(sender: users(:user1),
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

end
