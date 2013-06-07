class BankrollsController < ApplicationController
  def index
  	@bets = Bet.all.order('date_time ASC')
  	@bet_totals = {:risked => 0, :won => 0, :lost => 0, :net => 0, :units => 0, :roi=> 0, :win_percent => 0, :wins => 0, :losses => 0, :pushes => 0}
  	@bets.each do |bet|
  		@bet_totals[:risked] += bet.risk.to_i
  		if bet.grade == 'W'
  			if bet.line < 0
  				@bet_totals[:won] += ((100/bet.line.abs.to_f)*(bet.risk.to_f)).to_i
  			else
					@bet_totals[:won] += ((bet.line.abs.to_f/100)*(bet.risk.to_f)).to_i
				end
				@bet_totals[:wins] += 1
			elsif bet.grade == 'L'
				@bet_totals[:lost] += bet.risk
				@bet_totals[:losses] += 1
      elsif bet.grade == 'P'
        @bet_totals[:pushes] += 1
			end
		end
		@bet_totals[:net] = @bet_totals[:won] - @bet_totals[:lost]
		@bet_totals[:units] = (@bet_totals[:net].to_f)/100
		@bet_totals[:roi] = ((@bet_totals[:net].to_f)/@bet_totals[:risked]*100).round(2)
		@bet_totals[:win_percent] = ((@bet_totals[:wins].to_f/(@bet_totals[:wins] + @bet_totals[:losses]))*100).round(2)
  end

  def create
    bet_params = params.permit(:date_time, :away_team, :home_team, :play, :line, :risk, :grade)
    @bet = Bet.new(bet_params)
    if @bet.save
      redirect_to bankrolls_url
    end
  end

  def update
    @bet = Bet.find(params[:id])
    bet_params = params.permit(:date_time, :away_team, :home_team, :play, :line, :risk, :grade)
    if @bet.update(bet_params)
      redirect_to bankrolls_url
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
 		redirect_to bankrolls_url
  end

  def kelly
    kelly_params = params.permit(:odds, :win_percent, :multiplier)
    if kelly_params[:odds].to_f < 0
      odds = 100/(kelly_params[:odds].to_f.abs)
    else
      odds = (kelly_params[:odds].to_f.abs)/100
    end
    percent = kelly_params[:win_percent].to_f/100
    @kelly_result = ((((percent*(odds + 1)) - 1)/odds) * 100 * kelly_params[:multiplier].to_f).round(2)
    respond_to do |format|
      format.json { render json: @kelly_result }
    end
  end

  def implied
    implied_params = params.permit(:implied_odds, :implied_prob)
    num = implied_params[:implied_odds].to_f
    if num < 0
      @implied_result = ((num.abs/(num.abs + 100))*100).round(2)
    else
      @implied_result = ((100/(num.abs + 100))*100).round(2)
    end
    respond_to do |format|
      format.json { render json: @implied_result }
    end
  end
end
