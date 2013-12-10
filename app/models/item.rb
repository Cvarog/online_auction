class Item < ActiveRecord::Base
  belongs_to :category
  has_many :lots
end
