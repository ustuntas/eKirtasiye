class Admin::DashboardController < ApplicationController
  LOW_STOCK_THRESHOLD = 10

  def index
    @total_orders = Order.count
    @pending_orders = Order.pending.count
    @total_revenue = Order.sum(:total_amount)
    @monthly_revenue = Order.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).sum(:total_amount)

    @total_users = User.count
    @active_products = Product.active.count
    @pending_schools_count = School.pending.count
    @pending_school_accounts_count = SchoolAccount.pending.count

    @recent_orders = Order.includes(:user).order(created_at: :desc).limit(6)
    @pending_schools = School.pending.order(created_at: :asc).limit(5)
    @pending_school_accounts = SchoolAccount.includes(:school, :user).pending.order(created_at: :asc).limit(5)
    @low_stock_products = Product.active.where("stock_quantity <= ?", LOW_STOCK_THRESHOLD).order(stock_quantity: :asc).limit(8)
  end
end
