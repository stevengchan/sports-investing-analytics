class CreateTotals < ActiveRecord::Migration
  def change
    create_table :totals do |t|
      t.datetime :date_time
      t.string :sportsbook
      t.string :total
      t.integer :order_odds
      t.integer :under_odds
      t.references :matchup, index: true

      t.timestamps
    end
  end
end
