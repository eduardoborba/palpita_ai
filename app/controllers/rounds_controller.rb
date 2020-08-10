class RoundsController < ApplicationController
  before_action :set_round, only: %i[show destroy]
  before_action :authenticate_player!

  def new
    @bet_league = BetLeague.find(params[:bet_league_id])
    @round = @bet_league.rounds.build(
      accept_bets_after: Time.zone.now,
      accept_bets_until: 1.week.from_now
    )

    1.times { @round.games.build }
  end

  def edit
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
  end

  def create
    @bet_league = BetLeague.find(round_params[:bet_league_id])
    @round = @bet_league.rounds.build
    @round.attributes = round_params

    if @round.save
      redirect_to @bet_league,
                  notice: 'Rodada foi criada com sucesso.'
    else
      render :new
    end
  end

  def update
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
    @round.attributes = round_params

    if @round.save
      redirect_to @bet_league, notice: 'Rodada foi editada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @round.destroy
    redirect_to rounds_url,
                notice: 'Round was successfully destroyed.'
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(
      :bet_league_id,
      :accept_bets_after,
      :accept_bets_until,
      games_attributes: %i[id home_id visitor_id bet_league_id _destroy]
    )
  end
end
