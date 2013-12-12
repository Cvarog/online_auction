class Lot < ActiveRecord::Base
belongs_to :item

validates :name, :description,  presence: true
# validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :description, length: { minimum: 60 }

end
