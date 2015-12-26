class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    # @line_item = @cart.line_items.build(product: product)
    @line_item = @cart.add_product(product.id)
    if @line_item.save
      redirect_to cart_path, notice: 'Excellent purchase!'
    else
      redirect_to :back
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    if @line_item.quantity == 1 || params[:delete].present?
      @line_item.destroy
    else
      @line_item.update_attributes(quantity: @line_item.quantity -= 1)
    end
  end

end
