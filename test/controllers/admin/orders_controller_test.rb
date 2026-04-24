require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_orders_url
    assert_response :success
  end

  test "should get show" do
    get admin_order_url(FactoryBot.create(:order))
    assert_response :success
  end

  test "should get update" do
    patch admin_order_url(FactoryBot.create(:order)), params: { order: { } }
    assert_response :success
  end

  test "should get approve" do
    patch approve_admin_order_url(FactoryBot.create(:order))
    assert_response :success
  end

  test "should get ship" do
    patch ship_admin_order_url(FactoryBot.create(:order))
    assert_response :success
  end

  test "should get deliver" do
    patch deliver_admin_order_url(FactoryBot.create(:order))
    assert_response :success
  end

  test "should get cancel" do
    patch cancel_admin_order_url(FactoryBot.create(:order))
    assert_response :success
  end
end
