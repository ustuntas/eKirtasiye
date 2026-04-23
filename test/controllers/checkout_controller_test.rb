require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkout_index_url
    assert_response :success
  end

  test "should get create" do
    get checkout_create_url
    assert_response :success
  end

  test "should get address" do
    get checkout_address_url
    assert_response :success
  end

  test "should get save_address" do
    get checkout_save_address_url
    assert_response :success
  end

  test "should get payment" do
    get checkout_payment_url
    assert_response :success
  end

  test "should get process_payment" do
    get checkout_process_payment_url
    assert_response :success
  end

  test "should get confirmation" do
    get checkout_confirmation_url
    assert_response :success
  end
end
