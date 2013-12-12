class ChangeInItemsAndLotPriceToDecimal < ActiveRecord::Migration
  def change
  	remove_column :items, :price
  	remove_column :lots, :price
  	add_column :items, :price, :decimal
  	add_column :lots, :price, :decimal
  end
end
