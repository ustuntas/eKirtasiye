require "test_helper"

class Admin::SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_schools_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_schools_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_schools_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_schools_update_url
    assert_response :success
  end

  test "should get approve" do
    get admin_schools_approve_url
    assert_response :success
  end

  test "should get reject" do
    get admin_schools_reject_url
    assert_response :success
  end
end
