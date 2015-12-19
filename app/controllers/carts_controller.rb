class CartsController < ApplicationController

    def show
    @cart = Cart.find(session[:cart_id])
    @line_items = @cart.line_items

    @total_amount = 0
    # @total_amount = @cart.products.sum(&:price)
  end

end
