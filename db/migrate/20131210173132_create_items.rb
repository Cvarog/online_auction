class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :description
      t.integer :category_id
      t.integer :lot_id
      t.timestamps
    end
  end
end
