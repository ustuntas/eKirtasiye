require "test_helper"

class Account::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_root_url
    assert_response :success
  end
end
