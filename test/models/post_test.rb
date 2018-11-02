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

  test "also delete it's comments when a post is deleted" do 
    @post.save
    
    assert_difference ['Comment.count'], 1 do
      @post.comments.create(author: users(:user1),
                            content: "comment content")
    end

    assert_difference ['Comment.count'], -1 do
      @post.destroy
    end
  end 

end
