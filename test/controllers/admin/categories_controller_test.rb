require "test_helper"

class Admin::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_categories_url
    assert_response :success
  end

  test "should get show" do
    get admin_category_url(FactoryBot.create(:category))
    assert_response :success
  end

  test "should get new" do
    get new_admin_category_url
    assert_response :success
  end

  test "should get create" do
    post admin_categories_url, params: { category: { } }
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_category_url(FactoryBot.create(:category))
    assert_response :success
  end

  test "should get update" do
    patch admin_category_url(FactoryBot.create(:category)), params: { category: { } }
    assert_response :success
  end

  test "should get destroy" do
    delete admin_category_url(FactoryBot.create(:category))
    assert_response :success
  end
end
