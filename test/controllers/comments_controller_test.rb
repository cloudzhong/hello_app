require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  def setup
    @user = users(:cloud)
    @comment = comments(:one)
    
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post :create, comment: { content: "Lorem ipsum" , user: @user, micropost_id: 1}
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete :destroy, id: @comment
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    assert_no_difference 'Comment.count' do
      delete :destroy, id: @comment
    end
    assert_redirected_to root_url
  end
end
