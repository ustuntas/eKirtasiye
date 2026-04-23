require "test_helper"

class School::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get school_dashboard_index_url
    assert_response :success
  end
end
