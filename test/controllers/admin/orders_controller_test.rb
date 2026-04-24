require "test_helper"

class Admin::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_user = User.create!(
      email_address: "order-user-#{SecureRandom.hex(3)}@example.com",
      password: "password123",
      role: "customer"
    )
    @order = Order.create!(
      user: @order_user,
      total_amount: 250,
      order_status: :pending,
      payment_status: :unpaid
    )
  end

  test "renders orders management dashboard" do
    get admin_orders_url
    assert_response :success
    assert_select "h1", text: /Siparişleri Yönet/i
    assert_select "h2", text: /Sipariş Listesi/i
  end

  test "renders order detail page" do
    get admin_order_url(@order)
    assert_response :success
    assert_select "h1", text: /Sipariş ##{@order.id}/
  end

  test "updates order statuses" do
    patch admin_order_url(@order), params: { order: { order_status: "confirmed", payment_status: "paid" } }
    assert_redirected_to admin_order_url(@order)
    @order.reload
    assert_equal "confirmed", @order.order_status
    assert_equal "paid", @order.payment_status
  end

  test "deletes order" do
    assert_difference("Order.count", -1) do
      delete admin_order_url(@order)
    end

    assert_redirected_to admin_orders_url
  end
end
