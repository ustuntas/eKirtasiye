require "test_helper"

class Account::AddressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @address = addresses(:one)
  end

  test "should get index" do
    get account_addresses_url
    assert_response :success
  end

  test "should get show" do
    get account_address_url(@address)
    assert_response :success
  end

  test "should get new" do
    get new_account_address_url
    assert_response :success
  end

  test "should get create" do
    post account_addresses_url, params: { address: { city: "Istanbul" } }
    assert_response :success
  end

  test "should get edit" do
    get edit_account_address_url(@address)
    assert_response :success
  end

  test "should get update" do
    patch account_address_url(@address), params: { address: { city: "Ankara" } }
    assert_response :success
  end

  test "should get destroy" do
    delete account_address_url(@address)
    assert_response :success
  end
end
