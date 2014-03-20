class BetsController < ApplicationController
  #  нужен js для обработки ответа от девайза
  # before_filter :authenticate_user!

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
    @user = current_user
    @lot = Lot.find(params[:lot_id])
    @bet = Bet.create(lot: @lot, user: @user)
    PrivatePub.publish_to "/lots/update", lot_id: @bet.lot.id, expired_time: @bet.lot.expired_time.to_s
    render nothing: true
  end

  private

  def bet_params
    params.require(:bet).permit(:lot_id, :user_id) if params[:bet]
  end
end