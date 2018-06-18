require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should redirect to sign in if not signed in" do
    get profile_path(id: 1)
    assert_redirected_to new_user_session_path
  end

  test "should get index if signed in" do
    @user = users(:user1)
    @user.confirm
    sign_in @user
    get profile_path(id: 1)
    assert_select "div.Feed_container"
  end

end
