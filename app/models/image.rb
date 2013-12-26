class Image < ActiveRecord::Base
  belongs_to :items
  has_attached_file :item_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
