class RoundsController < ApplicationController
  before_action :set_round, only: %i[show edit update destroy]
  before_action :set_bet_league, only: %i[new create]
  before_action :authenticate_player!
  before_action :block_not_owner, only: %i[edit update destroy]
  before_action :block_not_admin, only: %i[new edit create update destroy]

  def show; end

  def new
    @round = @bet_league.rounds.build(
      accept_bets_after: Time.zone.now,
      accept_bets_until: 1.week.from_now
    )

    1.times { @round.games.build }
  end

  def edit; end

  def create
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
                notice: 'Rodada foi deletada com sucesso.'
  end

  private

  def set_round
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
  end

  def set_bet_league
    bet_league_id = params[:bet_league_id] || round_params[:bet_league_id]
    @bet_league = BetLeague.find(bet_league_id)
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
