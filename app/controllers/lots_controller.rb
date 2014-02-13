class LotsController < ApplicationController
  
  def index
    @lots = Lot.all
    @finished_lots = Lot.finished
    @active_lots = Lot.active
    @started_lots = Lot.started
  end

  def show
    @lot = Lot.find(params[:id])
  end
end
