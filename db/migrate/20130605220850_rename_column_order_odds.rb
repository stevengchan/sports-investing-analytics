class RenameColumnOrderOdds < ActiveRecord::Migration
  def change
  	rename_column :totals, :order_odds, :over_odds
  end
end
