class Account::DashboardController < ApplicationController
  def index
    @orders = Current.user.orders.includes(:order_items).order(created_at: :desc).limit(5)
    @addresses = Current.user.addresses.order(created_at: :desc).limit(3)
    @reviews = Current.user.reviews.includes(:product).order(created_at: :desc).limit(3)
    @school_points = SchoolPoint.where(user: Current.user).includes(:school).order(updated_at: :desc)
    @total_orders = Current.user.orders.count
    @total_spent = Current.user.orders.sum(:total_amount)
    @total_points = @school_points.sum(:balance)
  end
end
