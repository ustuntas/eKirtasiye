require "test_helper"

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test "renders users management dashboard" do
    get admin_users_url
    assert_response :success

    assert_select "h1", text: /Kullanıcı Yönetimi/i
    assert_select "h2", text: /Kullanıcı Listesi/i
  end
end
