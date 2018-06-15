require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(author: users(:user1),
                     content: "post text content")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should require an author" do
    @post.author = nil
    assert_not @post.valid?
  end

  test "content should be present" do 
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should not be too long" do 
    @post.content = "a" * 805 
    assert_not @post.valid?
  end

end
