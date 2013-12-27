class Item < ActiveRecord::Base
  belongs_to :category
  has_many :lots
  has_many :images

  validates :name, :description, :price,  presence: true, length: { minimum: 3 }
  validates :description, length: { minimum: 30 }
  validates :price, numericality: { greater_than_or_equal_to: 1 }

  accepts_nested_attributes_for :images, :allow_destroy => true
 end
