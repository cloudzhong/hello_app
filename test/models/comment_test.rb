require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @micropost = microposts(:tone)
    @comment = @micropost.comments.build(content: "Comments 1" , user: @user)
  end
  # test "the truth" do
  #   assert true
  # end
  test "should be valid" do
    assert @comment.valid?
  end
  
  test "user id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end
  
  test "content should be present " do
    @comment.content = "   "
    assert_not @comment.valid?
  end
  
  test "micropost should be present " do
    @comment.micropost_id = nil
    assert_not @comment.valid?
  end
  
  test "content should be at most 140 characters" do
    @comment.content = "a" * 141
    assert_not @comment.valid?
  end
  
end
