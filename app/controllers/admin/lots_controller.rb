class Admin::LotsController < Admin::BaseController

 before_filter :set_lot, except: [:index, :new, :create]

  def index
    @lots = Lot.all
  end

  def new
    # @items = Item.all
    @lot = Lot.new
  end

  def create
    @lot = Lot.new(lot_params)
    if @lot.save
      redirect_to admin_lots_path
    else
      render "new"
    end
  end

  def destroy
    @lot.destroy
    redirect_to admin_lots_path
  end

  def show
  end

  def edit
  end

  def update
    @lot.update(lot_params)

    redirect_to admin_lots_path
  end

  def set_lot
    @lot = Lot.find(params[:id])
  end
  
  private

  def lot_params
   params.require(:lot).permit(:name, :description, :price, :start_time, :expired_time, :time_step, :item_id)
  end


end
