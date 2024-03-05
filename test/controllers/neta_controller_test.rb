require "test_helper"

class NetaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get neta_index_url
    assert_response :success
  end

  test "should get show" do
    get neta_show_url
    assert_response :success
  end
end
