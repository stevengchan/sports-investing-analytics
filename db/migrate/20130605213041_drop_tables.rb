class DropTables < ActiveRecord::Migration
  def change
  	drop_table :moneylines
  	drop_table :totals
  end
end
