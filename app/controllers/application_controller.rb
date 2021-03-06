class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :set_cart

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end

  def items_id_in_cart
    session[:cart].keys.map { |id| id.to_i}
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
