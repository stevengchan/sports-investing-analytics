class CreatePercents < ActiveRecord::Migration
  def change
    create_table :percents do |t|
      t.float :away_ml
      t.float :home_ml
      t.float :over
      t.float :under
      t.references :matchup, index: true

      t.timestamps
    end
  end
end
