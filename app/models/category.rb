class Category < ActiveRecord::Base

  has_many  :items
  has_ancestry
  validates :name, presence: true, uniqueness: true, length: { minimum:3 }
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
