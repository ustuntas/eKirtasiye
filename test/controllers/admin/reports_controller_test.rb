require "test_helper"

class Admin::ReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_reports_index_url
    assert_response :success
  end

  test "should get sales" do
    get admin_reports_sales_url
    assert_response :success
  end

  test "should get school_points" do
    get admin_reports_school_points_url
    assert_response :success
  end

  test "should get products" do
    get admin_reports_products_url
    assert_response :success
  end
end
