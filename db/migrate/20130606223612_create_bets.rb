class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.datetime :date_time
      t.string :away_team
      t.string :home_team
      t.string :play
      t.integer :line
      t.float :risk
      t.string :grade
      t.references :user, index: true

      t.timestamps
    end
  end
end
