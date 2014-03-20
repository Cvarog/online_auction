class AddBetToUser < ActiveRecord::Migration
  def change
  	add_column :users, :bet, :integer
  end
end
