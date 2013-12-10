class CreateLots < ActiveRecord::Migration
  def change
    create_table :lots do |t|
      t.string :name
      t.float :price
      t.string :description
      t.time :end_time
      t.float :bet_step
      t.time :time_step
      t.integer :item_id

      t.timestamps
    end
  end
end
