require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_products_url
    assert_response :success
  end

  test "should get show" do
    get admin_product_url(FactoryBot.create(:product))
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_url
    assert_response :success
  end

  test "should get create" do
    post admin_products_url, params: { product: { } }
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_url(FactoryBot.create(:product))
    assert_response :success
  end

  test "should get update" do
    patch admin_product_url(FactoryBot.create(:product)), params: { product: { } }
    assert_response :success
  end

  test "should get destroy" do
    delete admin_product_url(FactoryBot.create(:product))
    assert_response :success
  end
end
