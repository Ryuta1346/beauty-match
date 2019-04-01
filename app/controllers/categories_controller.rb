class CategoriesController < ApplicationController
  def index
    @categoies = Category.all
  end
end
