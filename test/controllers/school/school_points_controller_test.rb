require "test_helper"

class School::SchoolPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get school_school_points_show_url
    assert_response :success
  end
end
