class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :lot

  after_create :increase_lot_expired_time

  private

  def increase_lot_expired_time
    self.lot.increase_expired_time
    self.lot.save!
  end
end
