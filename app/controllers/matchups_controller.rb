class MatchupsController < ApplicationController
	def initialize
		super
		@teams = {'ARI' => 'Arizona Diamondbacks', 
  				'ATL' => 'Atlanta Braves', 
  				'BAL' => 'Baltimore Orioles', 
  				'BOS' => 'Boston Red Sox', 
  				'CHC' => 'Chicago Cubs', 
  				'CWS' => 'Chicago White Sox', 
  				'CIN' => 'Cincinnati Reds', 
  				'CLE' => 'Cleveland Indians', 
  				'COL' => 'Colorado Rockies', 
  				'DET' => 'Detroit Tigers', 
  				'HOU' => 'Houston Astros', 
  				'KC' => 'Kansas City Royals', 
  				'LAA' => 'Los Angeles Angels', 
  				'LAD' => 'Los Angeles Dodgers', 
  				'MIA' => 'Miami Marlins', 
  				'MIL' => 'Milwaukee Brewers', 
  				'MIN' => 'Minnesota Twins', 
  				'NYM' => 'New York Mets', 
  				'NYY' => 'New York Yankees', 
  				'OAK' => 'Oakland Athletics', 
  				'PHI' => 'Philadelphia Phillies', 
  				'PIT' => 'Pittsburgh Pirates', 
  				'SD' => 'San Diego Padres', 
  				'SF' => 'San Francisco Giants', 
  				'SEA' => 'Seattle Mariners', 
  				'STL' => 'St. Louis Cardinals', 
  				'TB' => 'Tampa Bay Rays', 
  				'TEX' => 'Texas Rangers', 
  				'TOR' => 'Toronto Blue Jays', 
  				'WAS' => 'Washington Nationals'}
	end

  def index
  	@matchups = Matchup.all.order('date_time DESC').limit(15)
  	@teams
  end

  def show
  	@matchup = Matchup.find(params[:id])
  	@moneylines = @matchup.moneylines.order('date_time ASC')
  	@totals = @matchup.totals.order('date_time ASC')
    @percents = @matchup.percents
  	@teams
  end
end
