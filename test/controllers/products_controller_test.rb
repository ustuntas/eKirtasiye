require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_index_url
    assert_response :success
  end

  test "should get show" do
    get products_show_url
    assert_response :success
  end

  test "should get add_to_cart" do
    get products_add_to_cart_url
    assert_response :success
  end

  test "should get add_to_favorites" do
    get products_add_to_favorites_url
    assert_response :success
  end
end
