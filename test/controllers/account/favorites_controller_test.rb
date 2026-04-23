require "test_helper"

class Account::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_favorites_index_url
    assert_response :success
  end

  test "should get destroy" do
    get account_favorites_destroy_url
    assert_response :success
  end
end
