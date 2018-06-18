require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test "should redirect to sign in if not signed in" do
    get root_path
    assert_redirected_to new_user_session_path
  end

  test "should get index if signed in" do
    @user = users(:user1)
    @user.confirm
    sign_in @user
    get root_path
    assert_select "div.Feed_container"
  end

end
