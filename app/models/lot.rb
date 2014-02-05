class Lot < ActiveRecord::Base
belongs_to :item
has_many :bets, dependent: :destroy

validates :name, :description, :price, :time_step, :expired_time, presence: true
validates :price, numericality: { greater_than_or_equal_to: 1 }
validates :description, length: { minimum: 30 }
validates :name, length: { minimum: 3 }

end
