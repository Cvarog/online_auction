class BetsController < ApplicationController

  def create
    @lot = Lot.find(params[:lot_id])
    @bet = @lot.bets.build
    if @bet.save
      @lot.update(expired_time: @lot.expired_time + @lot.time_step.minutes)
      redirect_to lot_path(@lot)
    else
      redirect_to lot_path(@lot)
    end
  end
end
