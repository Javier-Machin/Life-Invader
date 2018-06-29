require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    @user = users(:user1)
    @user.confirm
    sign_in @user
  end

  test "should not allow wrong user to delete comments" do
    #User1 create a post
    post comments_path(comment: { content: "comment content", 
                                  post:    @user.posts.first })
    @comment = @user.comments.last
    #Attempt to delete that comment as User3
    @user = users(:user3)
    @user.confirm
    sign_in @user
    delete comment_path(@comment)
    #Confirm it's still there
    assert User.first.comments.last.content == "comment content"
  end
end
