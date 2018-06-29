require 'test_helper'

class FriendRequestsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    #User1 sends User2 a friend request
    @user = users(:user1)
    @user.confirm
    sign_in @user
    @friendrequest = @user.friend_requests.create(receiver: users(:user2))
  end

  test "should not allow wrong user to decline friend requests" do
    #Confirm that User2 received one request
    @user = users(:user2)
    @user.confirm
    sign_in @user
    assert @user.requests_received.count == 1
    #Attempt to decline that request as User3
    @user = users(:user3)
    @user.confirm
    sign_in @user
    delete friend_request_path(@friendrequest)
    #Confirm it's still there
    assert User.second.requests_received.count == 1
  end

  test "should allow friend request's receiver to decline it" do 
    @user = users(:user2)
    @user.confirm
    sign_in @user
    delete friend_request_path(@friendrequest)
    #Confirm it has been declined
    assert User.second.requests_received.count == 0
  end

end
