require "test_helper"

class DislikeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dislike_index_url
    assert_response :success
  end

  test "should get show" do
    get dislike_show_url
    assert_response :success
  end
end
