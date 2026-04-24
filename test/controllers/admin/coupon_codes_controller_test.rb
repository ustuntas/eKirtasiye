require "test_helper"

class Admin::CouponCodesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_coupon_codes_url
    assert_response :success
  end

  test "should get show" do
    get admin_coupon_code_url(FactoryBot.create(:coupon_code))
    assert_response :success
  end

  test "should get new" do
    get new_admin_coupon_code_url
    assert_response :success
  end

  test "should get create" do
    post admin_coupon_codes_url, params: { coupon_code: { } }
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_coupon_code_url(FactoryBot.create(:coupon_code))
    assert_response :success
  end

  test "should get update" do
    patch admin_coupon_code_url(FactoryBot.create(:coupon_code)), params: { coupon_code: { } }
    assert_response :success
  end

  test "should get destroy" do
    delete admin_coupon_code_url(FactoryBot.create(:coupon_code))
    assert_response :success
  end
end
