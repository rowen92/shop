class ProductsController < ApplicationController

  def index
    @category = Category.where(id: params[:category]).first if params[:category].present?

    @products = if params[:query].present?
                  Product.search(params[:query])
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

  def search_suggestions
    results = if params[:query].present?
                Product.search_for_ajax(params[:query])
              else
                []
              end
    render json: results
  end

end
