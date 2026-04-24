require "test_helper"

class Admin::ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: "Test Category #{SecureRandom.hex(3)}", active: true)
    @product = Product.create!(
      name: "Kalem",
      sku: "SKU-#{SecureRandom.hex(3)}",
      price: 10,
      stock_quantity: 20,
      point_value: 1,
      active: true,
      category: @category
    )
  end

  test "renders products management dashboard" do
    get admin_products_url
    assert_response :success
    assert_select "h1", text: /Ürünleri Yönet/i
    assert_select "h2", text: /Ürün Listesi/i
  end

  test "renders edit form" do
    get edit_admin_product_url(@product)
    assert_response :success
    assert_select "h1", text: /Ürün Düzenle/i
    assert_select "input[name='product[name]']"
  end

  test "updates product" do
    patch admin_product_url(@product), params: { product: { name: "Güncel Kalem" } }
    assert_redirected_to admin_product_url(@product)
    assert_equal "Güncel Kalem", @product.reload.name
  end
end
