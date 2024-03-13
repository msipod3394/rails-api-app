require "test_helper"

class ItemIngredientControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_ingredient_index_url
    assert_response :success
  end

  test "should get show" do
    get item_ingredient_show_url
    assert_response :success
  end
end
