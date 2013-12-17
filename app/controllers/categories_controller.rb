class CategoriesController < ApplicationController


  def index
    @categories = Category.all
    # render text: params.inspect
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
      @category = Category.new(category_params)
      # @zombie = Zombie.create(params[:zombie])
      if @category.save
        redirect_to categories_path
      else
        render "new"
      end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    redirect_to categories_path
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
