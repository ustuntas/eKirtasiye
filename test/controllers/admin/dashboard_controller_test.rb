require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "renders modern admin dashboard sections" do
    get admin_root_url
    assert_response :success

    assert_select "h1", text: /Admin Dashboard/i
    assert_select "h2", text: /Son Siparişler/i
    assert_select "h2", text: /Onay Bekleyenler/i
    assert_select "h2", text: /Stok Uyarıları/i
  end
end
