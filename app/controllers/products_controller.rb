class ProductsController < ApplicationController

  def index
    @category = Category.where(id: params[:category]).first if params[:category].present?
    @categories = Category.all.order(:title)

    @products = if params[:query].present?
                  Product.search(params[:query]).paginate(page: params[:page])
                else
                  if @category.present?
                    @category.products.paginate(page: params[:page])
                  else
                    Product.paginate(page: params[:page])
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
