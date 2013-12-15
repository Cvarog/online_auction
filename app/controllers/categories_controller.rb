class CategoriesController < ApplicationController


  def index
    @categories = Category.all
    # render text: params.inspect
  end


end
