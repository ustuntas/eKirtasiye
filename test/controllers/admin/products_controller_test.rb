require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  test "renders products management dashboard" do
    get admin_products_url
    assert_response :success

    assert_select "h1", text: /Ürün Yönetimi/i
    assert_select "h2", text: /Ürün Listesi/i
  end
end
