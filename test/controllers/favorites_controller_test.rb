require "test_helper"

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favorites_url
    assert_response :success
  end

  test "should get destroy" do
    delete favorite_url(FactoryBot.create(:favorite))
    assert_response :success
  end
end
