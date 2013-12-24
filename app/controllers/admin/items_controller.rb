class Admin::ItemsController < Admin::BaseController

  before_filter :set_item, except: [:index, :new, :create]

  def index
    @items = Item.all
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render "new"
    end
  end
  
  def new
    @item = Item.new
  end
  
  def edit
  end

  def update
    
    @item.update(item_params)

    redirect_to admin_items_path
  end

  def destroy
    @item.destroy
    redirect_to admin_categories_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :price)
  end


























end
