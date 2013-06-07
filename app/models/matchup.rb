class Matchup < ActiveRecord::Base
	has_many :moneylines
	has_many :totals
	has_many :percents
end
