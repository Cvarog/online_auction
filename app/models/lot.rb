class Lot < ActiveRecord::Base
belongs_to :item

validates :name, :description, :price, :bet_step, :end_time, presence: true
validates :price, numericality: { greater_than_or_equal_to: 1 }
validates :bet_step, numericality: { greater_than_or_equal_to: 0.25 }
validates :description, length: { minimum: 30 }

end
