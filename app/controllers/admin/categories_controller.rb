class Admin::CategoriesController < Admin::BaseController

  inherit_resources

  respond_to :html

  before_action :build_resource, only: [:index, :new]
  before_filter :set_category, except: [:index, :new, :create]

  private

  def set_category
    @category = Category.find(params[:id])
  end

  # def category_params
  #   params.require(:category).permit(:name, :picture, :parent_id)
  # end

  def build_resource_params
    [params.fetch(:category, {}).permit(:name, :picture, :parent_id)]
  end
  
end