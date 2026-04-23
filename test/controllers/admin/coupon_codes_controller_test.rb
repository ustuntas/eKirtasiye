require "test_helper"

class Admin::CouponCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_coupon_codes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_coupon_codes_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_coupon_codes_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_coupon_codes_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_coupon_codes_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_coupon_codes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_coupon_codes_destroy_url
    assert_response :success
  end
end
