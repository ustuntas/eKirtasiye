require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

  test "should get cancel" do
    get orders_cancel_url
    assert_response :success
  end

  test "should get request_refund" do
    get orders_request_refund_url
    assert_response :success
  end
end
