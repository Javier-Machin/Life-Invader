require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(author:   users(:user1),
                     likeable: posts(:first))
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "also works with comments" do 
    @like.likeable = Comment.first
    assert @like.valid?
  end

  test "should require an author" do
    @like.author = nil
    assert_not @like.valid?
  end

  test "should require a post" do 
    @like.likeable = nil
    assert_not @like.valid?
  end

  test "same post can't have more than 1 like per user" do
    duplicate_like = @like.dup
    @like.save 
    assert_not duplicate_like.valid?
  end

  test "different users can like same post" do
    @like.save
    other_like = Like.new(author:   users(:user2),
                          likeable: posts(:first))
    assert other_like.valid?
  end

end
