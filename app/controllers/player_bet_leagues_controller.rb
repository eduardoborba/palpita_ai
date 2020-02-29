class PlayerBetLeaguesController < ApplicationController
  before_action :authenticate_player!

  # GET /player_bet_leagues
  # GET /player_bet_leagues.json
  def index
    @player_bet_leagues = PlayerBetLeague.all
  end

  # GET /player_bet_leagues/1
  # GET /player_bet_leagues/1.json
  def show
  end

  # GET /player_bet_leagues/new
  def new
    @player_bet_league_form = PlayerBetLeagueForm.new(bet_league_id: params[:bet_league_id])
  end

  # GET /player_bet_leagues/1/edit
  def edit
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

  # PATCH/PUT /player_bet_leagues/1
  # PATCH/PUT /player_bet_leagues/1.json
  def update
    respond_to do |format|
      if @player_bet_league.update(player_bet_league_params)
        format.html { redirect_to @player_bet_league, notice: 'Participantes convidados com sucesso.' }
        format.json { render :show, status: :ok, location: @player_bet_league }
      else
        format.html { render :edit }
        format.json { render json: @player_bet_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_bet_leagues/1
  # DELETE /player_bet_leagues/1.json
  def destroy
    @player_bet_league.destroy
    respond_to do |format|
      format.html { redirect_to player_bet_leagues_url, notice: 'Player bet league was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def player_bet_league_params
      params.require(:player_bet_league_form).permit(:bet_league_id, :player_accumulated_score, player_ids: [])
    end
end
