class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  private

  def current_cart
    if Current.user
      Cart.find_or_create_by(user: Current.user)
    else
      guest_token = session[:guest_cart_token] ||= SecureRandom.uuid
      cart = Cart.find_by(session_id: guest_token)
      cart ||= Cart.create(session_id: guest_token)
      session[:guest_cart_token] = guest_token
      cart
    end
  end
  helper_method :current_cart

  def cart_item_count
    current_cart.cart_items.distinct.count(:product_id)
  end
  helper_method :cart_item_count
end
