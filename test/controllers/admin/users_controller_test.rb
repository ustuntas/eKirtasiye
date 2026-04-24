require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @managed_user = User.create!(
      email_address: "managed-#{SecureRandom.hex(3)}@example.com",
      password: "password123",
      role: "customer"
    )
  end

  test "renders users management dashboard" do
    get admin_users_url
    assert_response :success
    assert_select "h1", text: /Kullanıcı Yönetimi/i
    assert_select "h2", text: /Kullanıcı Listesi/i
  end

  test "renders edit form" do
    get edit_admin_user_url(@managed_user)
    assert_response :success
    assert_select "h1", text: /Kullanıcı Düzenle/i
  end

  test "changes user role" do
    post change_role_admin_user_url(@managed_user, role: "school_admin")
    assert_redirected_to admin_user_url(@managed_user)
    assert_equal "school_admin", @managed_user.reload.role
  end
end
