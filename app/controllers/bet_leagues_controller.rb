class BetLeaguesController < ApplicationController
  before_action :set_bet_league, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_player!

  def index
    @bet_leagues = BetLeague.all
  end

  def show; end

  def new
    @bet_league = BetLeague.new
  end

  def edit; end

  def create
    @bet_league = BetLeague.new(bet_league_params)
    @bet_league.owner_id = current_player.id
    @bet_league.status = 'unstarted'

    if @bet_league.save
      redirect_to new_player_bet_league_path(bet_league_id: @bet_league.id),
                  notice: 'Liga foi criada com sucesso, agora convide pessoas para participar da sua liga.'
    else
      render :new
    end
  end

  def update
    if @bet_league.update(bet_league_params)
      redirect_to @bet_league, notice: 'Bet league was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @bet_league.destroy
    redirect_to bet_leagues_url, notice: 'Bet league was successfully destroyed.'
  end

  private

  def set_bet_league
    @bet_league = BetLeague.includes(rounds: :games)
                           .find(params[:id])
  end

  def bet_league_params
    params.require(:bet_league).permit(:name, :description)
  end
end
