class PlayerBetLeaguesController < ApplicationController
  before_action :authenticate_player!

  # GET /player_bet_leagues/new
  def new
    @player_bet_league_form = PlayerBetLeagueForm.new(bet_league_id: params[:bet_league_id])
  end

  # POST /player_bet_leagues
  # POST /player_bet_leagues.json
  def create
    @player_bet_league_form = PlayerBetLeagueForm.new(player_bet_league_params)

    respond_to do |format|
      if @player_bet_league_form.submit
        format.html { redirect_to @player_bet_league_form.bet_league, notice: 'Participantes convidados com sucesso.' }
        format.json { render :show, status: :created, location: @player_bet_league_form.bet_league }
      else
        format.html { render :new }
        format.json { render json: @player_bet_league_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def player_bet_league_params
      params.require(:player_bet_league_form).permit(:bet_league_id, :player_accumulated_score, player_ids: [])
    end
end
