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
    assert_select "div.feed_container"
  end
  
  test "should not allow wrong user to delete posts" do
    #User1 create a post
    @user = users(:user1)
    @user.confirm
    sign_in @user
    post posts_path(post: { content: "post content", author: @user.id })
    @post = @user.posts.last
    #Attempt to delete that post as User3
    @user = users(:user3)
    @user.confirm
    sign_in @user
    delete post_path(@post)
    #Confirm it's still there
    assert User.first.posts.last.content == "post content"
  end
end
