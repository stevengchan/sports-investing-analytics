class CreateMoneylines < ActiveRecord::Migration
  def change
    create_table :moneylines do |t|
      t.datetime :date_time
      t.string :sportsbook
      t.integer :away_ml
      t.integer :home_ml
      t.references :matchup, index: true

      t.timestamps
    end
  end
end
