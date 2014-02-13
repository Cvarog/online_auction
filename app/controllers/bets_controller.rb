class BetsController < ApplicationController

  respond_to :js
  # def create
  #   @lot = Lot.find(params[:lot_id])
  #   @bet = @lot.bets.build
  #   if @bet.save
  #     @lot.update(expired_time: @lot.expired_time + @lot.time_step.minutes)
  #     redirect_to lot_path(@lot)
  #   else
  #     redirect_to lot_path(@lot)
  #   end
  # end
  
  def create
    @lot = Lot.find(params[:lot_id])
    # @bet = Bet.create(bet_params.merge(lot: @lot))
    @bet = Bet.create(lot: @lot)
    PrivatePub.publish_to "/lots/update", lot_id: @bet.lot.id, expired_time: @bet.lot.expired_time.to_s
    render nothing: true
  end

  private

  def bet_params
    params.require(:bet).permit(:lot_id) if params[:bet]
  end
end