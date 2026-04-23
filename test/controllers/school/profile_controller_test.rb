require "test_helper"

class School::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get school_profile_show_url
    assert_response :success
  end

  test "should get edit" do
    get school_profile_edit_url
    assert_response :success
  end

  test "should get update" do
    get school_profile_update_url
    assert_response :success
  end
end
