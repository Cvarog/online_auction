class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  after_create :increase_lot_expired_time, :user_bet_write_off

  private

  def increase_lot_expired_time
    self.lot.increase_expired_time
    self.lot.save!
  end

  def user_bet_write_off
    self.user.bet_write_off
    self.user.save!
  end
end
