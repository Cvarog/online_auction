class AddAttachmentPictureToImages < ActiveRecord::Migration
  def self.up
    change_table :images do |t|
      t.attachment :item_image
    end
  end

  def self.down
    drop_attached_file :categories, :item_image
  end
end
