require "test_helper"

class DonControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get don_index_url
    assert_response :success
  end

  test "should get show" do
    get don_show_url
    assert_response :success
  end
end
