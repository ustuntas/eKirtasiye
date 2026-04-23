require "test_helper"

class Account::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_reviews_index_url
    assert_response :success
  end

  test "should get create" do
    get account_reviews_create_url
    assert_response :success
  end

  test "should get destroy" do
    get account_reviews_destroy_url
    assert_response :success
  end
end
