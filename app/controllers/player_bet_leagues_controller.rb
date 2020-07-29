class PlayerBetLeaguesController < ApplicationController
  before_action :authenticate_player!

  def new
    @player_bet_league_form = PlayerBetLeagueForm.new(bet_league_id: params[:bet_league_id])
  end

  def create
    @player_bet_league_form = PlayerBetLeagueForm.new(player_bet_league_params)

    if @player_bet_league_form.submit
      redirect_to @player_bet_league_form.bet_league,
                  notice: 'Participantes convidados com sucesso.'
    else
      render :new
    end
  end

  private

  def player_bet_league_params
    params.require(:player_bet_league_form).permit(:bet_league_id, :player_accumulated_score, player_ids: [])
  end
end
