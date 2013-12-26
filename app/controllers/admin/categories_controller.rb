class Admin::CategoriesController < Admin::BaseController
  
  before_filter :set_category, except: [:index, :new, :create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
  end

  def create
      @category = Category.new(category_params)
      # @zombie = Zombie.create(params[:zombie])
      if @category.save
        redirect_to admin_categories_path
      else
        render "new"
      end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path
  end

  def edit
  end

  def update
    @category.update(category_params)

    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :picture, :parent_id)
  end

end
