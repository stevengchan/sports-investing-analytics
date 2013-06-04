class CreateMatchups < ActiveRecord::Migration
  def change
    create_table :matchups do |t|
      t.string :away_team
      t.string :home_team
      t.string :away_pitcher
      t.string :home_pitcher

      t.timestamps
    end
  end
end
