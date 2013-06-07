class AddDateTimeToMatchups < ActiveRecord::Migration
  def change
    add_column :matchups, :date, :date
    add_column :matchups, :time, :time
  end
end
