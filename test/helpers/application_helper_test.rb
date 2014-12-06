require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Cloud is doing this sample"
    assert_equal full_title("Help"), "Help | Cloud is doing this sample"
  end
end