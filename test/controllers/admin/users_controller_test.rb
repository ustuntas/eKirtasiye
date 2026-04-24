require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_url
    assert_response :success
  end

  test "should get show" do
    get admin_user_url(FactoryBot.create(:user))
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_user_url(FactoryBot.create(:user))
    assert_response :success
  end

  test "should get update" do
    patch admin_user_url(FactoryBot.create(:user)), params: { user: { } }
    assert_response :success
  end

  test "should get change_role" do
    patch change_role_admin_user_url(FactoryBot.create(:user)), params: { user: { role: "admin" } }
    assert_response :success
  end

  test "should get toggle_active" do
    patch toggle_active_admin_user_url(FactoryBot.create(:user))
    assert_response :success
  end
end
