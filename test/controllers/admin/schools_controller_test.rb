require "test_helper"

class Admin::SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = schools(:one)
  end

  test "should get index" do
    get admin_schools_url
    assert_response :success
  end

  test "should get show" do
    get admin_school_url(@school)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_school_url(@school)
    assert_response :success
  end

  test "should get update" do
    patch admin_school_url(@school), params: { school: { name: "Updated School" } }
    assert_response :success
  end

  test "should get approve" do
    post approve_admin_school_url(@school)
    assert_response :success
  end

  test "should get reject" do
    post reject_admin_school_url(@school)
    assert_response :success
  end
end
