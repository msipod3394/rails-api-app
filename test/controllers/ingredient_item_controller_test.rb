require "test_helper"

class IngredientItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredient_item_index_url
    assert_response :success
  end

  test "should get show" do
    get ingredient_item_show_url
    assert_response :success
  end
end
