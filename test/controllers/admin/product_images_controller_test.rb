require "test_helper"

class Admin::ProductImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_product_images_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_product_image_url
    assert_response :success
  end

  test "should get create" do
    post admin_product_images_url, params: { product_image: { } }
    assert_response :success
  end

  test "should get show" do
    get admin_product_image_url(FactoryBot.create(:product_image))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_product_image_url(FactoryBot.create(:product_image))
    assert_response :success
  end

  test "should get update" do
    patch admin_product_image_url(FactoryBot.create(:product_image)), params: { product_image: { } }
    assert_response :success
  end

  test "should get destroy" do
    delete admin_product_image_url(FactoryBot.create(:product_image))
    assert_response :success
  end
end
