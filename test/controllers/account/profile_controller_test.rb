require "test_helper"

class Account::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get account_profile_show_url
    assert_response :success
  end

  test "should get edit" do
    get account_profile_edit_url
    assert_response :success
  end

  test "should get update" do
    get account_profile_update_url
    assert_response :success
  end
end
