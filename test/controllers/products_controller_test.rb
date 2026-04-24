require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get show" do
    get product_url(FactoryBot.create(:product))
    assert_response :success
  end

  test "should get add_to_cart" do
    post add_to_cart_product_url(FactoryBot.create(:product))
    assert_response :success
  end

  test "should get add_to_favorites" do
    post add_to_favorites_product_url(FactoryBot.create(:product))
    assert_response :success
  end
end
