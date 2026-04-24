require "test_helper"

class Admin::SchoolAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_school_accounts_url
    assert_response :success
  end

  test "should get show" do
    get admin_school_account_url(FactoryBot.create(:school_account))
    assert_response :success
  end

  test "should get update" do
    patch admin_school_account_url(FactoryBot.create(:school_account)), params: { school_account: { } }
    assert_response :success
  end

  test "should get approve" do
    patch approve_admin_school_account_url(FactoryBot.create(:school_account)), params: { school_account: { } }
    assert_response :success
  end

  test "should get reject" do
    patch reject_admin_school_account_url(FactoryBot.create(:school_account)), params: { school_account: { } }
    assert_response :success
  end
end
