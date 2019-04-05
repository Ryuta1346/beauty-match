class CategoriesController < ApplicationController
  def index
    @categoies = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
end
