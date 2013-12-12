class Item < ActiveRecord::Base
  belongs_to :category
  has_many :lots

  validates :name, :description, :price,  presence: true
  validates :name, length: { minimum: 3 }
  validates :description, length: { minimum: 60 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }
 
 end
