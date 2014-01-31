class ChangeColumnsInLots < ActiveRecord::Migration
  def change
    remove_column :lots, :bet_step
    remove_column :lots, :end_time
    remove_column :lots, :price
    remove_column :lots, :time_step

    add_column :lots, :price, :decimal, precision: 8, scale: 2
    add_column :lots, :expired_time, :datetime
    add_column :lots, :time_step, :integer
  end
end
