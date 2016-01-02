class OrdersController < ApplicationController

  def create
    @cart = current_cart
    @order = Order.new(order_params)
    @order.add_line_items_from_cart(@cart)
    @order.status = 'new'

    if @cart.line_items.empty?
      redirect_to products_path, notice: 'Your cart is empty'
      return
    end

    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path, notice: 'Thank you for your order.'
    else
      @cart = current_cart
      redirect_to :back, notice: 'Something is wrong'
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :phone)
  end

end
