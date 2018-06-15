require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(author: users(:user1),
                           post: posts(:first),
                           content: "comment text content")
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "should require an author" do
    @comment.author = nil
    assert_not @comment.valid?
  end

  test "should require a post" do
    @comment.post = nil
    assert_not @comment.valid?
  end

  test "content should be present" do 
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content should not be too long" do 
    @comment.content = "a" * 451 
    assert_not @comment.valid?
  end
end
