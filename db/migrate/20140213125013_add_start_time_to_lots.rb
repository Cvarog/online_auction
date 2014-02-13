class AddStartTimeToLots < ActiveRecord::Migration
  def change
    add_column :lots, :start_time, :datetime
  end
end
