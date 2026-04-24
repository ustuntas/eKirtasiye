class Admin::OrdersController < ApplicationController
  before_action :set_order, only: %i[show update approve ship deliver cancel]

  def index
    @orders = Order.includes(:user).order(created_at: :desc).limit(100)
    @pending_orders_count = Order.pending.count
    @paid_orders_count = Order.payment_status_paid.count
    @total_revenue = Order.sum(:total_amount)
  end

  def show
  end

  def update
    if @order.update(order_params)
      redirect_to admin_order_path(@order), notice: "Sipariş güncellendi."
    else
      render :show, status: :unprocessable_entity
    end
  end

  def approve
    @order.update(order_status: :confirmed)
    redirect_to admin_order_path(@order), notice: "Sipariş onaylandı."
  end

  def ship
    @order.update(order_status: :shipped)
    redirect_to admin_order_path(@order), notice: "Sipariş kargoya verildi olarak güncellendi."
  end

  def deliver
    @order.update(order_status: :delivered)
    redirect_to admin_order_path(@order), notice: "Sipariş teslim edildi olarak güncellendi."
  end

  def cancel
    @order.update(order_status: :cancelled)
    redirect_to admin_order_path(@order), notice: "Sipariş iptal edildi."
  end

  private

  def set_order
    @order = Order.includes(order_items: :product, user: {}, address: {}, payment: {}, shipment: {}).find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_status, :payment_status, :shipment_cost, :discount_amount)
  end
end
