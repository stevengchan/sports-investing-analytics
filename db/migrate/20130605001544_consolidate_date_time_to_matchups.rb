class ConsolidateDateTimeToMatchups < ActiveRecord::Migration
  def change
  	remove_column :matchups, :date
  	remove_column :matchups, :time
  	add_column :matchups, :date_time, :datetime
  end
end
