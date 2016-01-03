class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to cart_path, notice: 'Oh yes ^^'
    else
      redirect_to :back
    end
  end

  def increment_quantity
    @line_item = LineItem.find(params[:line_item])
    @line_item.update_attributes(quantity: @line_item.quantity += 1)
    respond_to do |format|
      format.js
    end
  end

  def decrement_quantity
    @line_item = LineItem.find(params[:line_item])
    if @line_item.quantity == 1 || params[:delete].present?
      @line_item.destroy
    else
      @line_item.update_attributes(quantity: @line_item.quantity -= 1)
    end
    respond_to do |format|
      format.js
    end
  end

end
