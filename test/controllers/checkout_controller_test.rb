require "test_helper"

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get checkout_url
    assert_response :success
  end

  test "should get address" do
    get checkout_address_url
    assert_response :success
  end

  test "should get save_address" do
    post checkout_save_address_url, params: { checkout: { } }
    assert_response :success
  end

  test "should get payment" do
    get checkout_payment_url
    assert_response :success
  end

  test "should get process_payment" do
    post checkout_process_payment_url, params: { checkout: { } }
    assert_response :success
  end

  test "should get confirmation" do
    get checkout_confirmation_url
    assert_response :success
  end
end
