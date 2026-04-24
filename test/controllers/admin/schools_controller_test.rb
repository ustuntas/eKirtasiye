require "test_helper"

class Admin::SchoolsControllerTest < ActionDispatch::IntegrationTest
  test "renders schools management dashboard" do
    get admin_schools_url
    assert_response :success

    assert_select "h1", text: /Okul Yönetimi/i
    assert_select "h2", text: /Okul Listesi/i
  end
end
