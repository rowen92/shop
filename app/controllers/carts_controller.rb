class CartsController < ApplicationController

  def show
    @cart = Cart.find(session[:cart_id])
    @line_items = @cart.line_items
    @order = Order.new
  end

  def destroy
    @cart = Cart.find(session[:cart_id])
    @cart.destroy
    redirect_to root_path, notice: 'Cart is empty!'
  end

end