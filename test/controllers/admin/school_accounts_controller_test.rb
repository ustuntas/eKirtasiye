require "test_helper"

class Admin::SchoolAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_school_accounts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_school_accounts_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_school_accounts_update_url
    assert_response :success
  end

  test "should get approve" do
    get admin_school_accounts_approve_url
    assert_response :success
  end

  test "should get reject" do
    get admin_school_accounts_reject_url
    assert_response :success
  end
end
