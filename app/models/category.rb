class Category < ActiveRecord::Base

  has_many  :items
  has_ancestry
  validates :name, presence: true, uniqueness: true, length: { minimum:3 }

end
