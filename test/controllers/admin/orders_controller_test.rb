require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "renders orders management dashboard" do
    get admin_orders_url
    assert_response :success

    assert_select "h1", text: /Sipariş Yönetimi/i
    assert_select "h2", text: /Sipariş Listesi/i
  end
end
