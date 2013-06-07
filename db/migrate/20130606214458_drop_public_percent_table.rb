class DropPublicPercentTable < ActiveRecord::Migration
  def change
  	drop_table :public_percents
  end
end
