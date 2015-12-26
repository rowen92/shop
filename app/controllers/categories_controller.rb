class CategoriesController < ApplicationController

  before_action :set_category, only: [:show]

  def index
    @categories = Category.all.order(:title)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title, :short_description, :description,
                                     :position, :meta_title, :meta_description,
                                     :meta_keywords, :image, :remote_image_url)
  end

end
