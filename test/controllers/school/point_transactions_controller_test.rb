require "test_helper"

class School::PointTransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get school_point_transactions_index_url
    assert_response :success
  end
end
