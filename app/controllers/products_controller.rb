class ProductsController < ApplicationController

  def index
    @category = Category.where(id: params[:category]).first if params[:category].present?

    @products = if params[:search].present?
                  Product.search(params[:search])
                else
                  if @category.present?
                    @category.products
                  else
                    Product.all
                  end
                end
  end

  def show
    @product = Product.find(params[:id])
  end

end
