class LotsController < ApplicationController
  
  def index
    @lots = Lot.all
  end

  def show
    @lot = Lot.find(params[:id])
  end
end
