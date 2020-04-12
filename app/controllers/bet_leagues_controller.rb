class BetLeaguesController < ApplicationController
  before_action :set_bet_league, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_player!

  # GET /bet_leagues
  # GET /bet_leagues.json
  def index
    @bet_leagues = BetLeague.all
  end

  # GET /bet_leagues/1
  # GET /bet_leagues/1.json
  def show
  end

  # GET /bet_leagues/new
  def new
    @bet_league = BetLeague.new
  end

  # GET /bet_leagues/1/edit
  def edit
  end

  # POST /bet_leagues
  # POST /bet_leagues.json
  def create
    @bet_league = BetLeague.new(bet_league_params)
    @bet_league.owner_id = current_player.id
    @bet_league.status = 'unstarted'

    respond_to do |format|
      if @bet_league.save
        format.html { redirect_to new_player_bet_league_path(bet_league_id: @bet_league.id), notice: 'Liga foi criada com sucesso, agora convide pessoas para participar da sua liga.' }
        format.json { render :show, status: :created, location: @bet_league }
      else
        format.html { render :new }
        format.json { render json: @bet_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bet_leagues/1
  # PATCH/PUT /bet_leagues/1.json
  def update
    respond_to do |format|
      if @bet_league.update(bet_league_params)
        format.html { redirect_to @bet_league, notice: 'Bet league was successfully updated.' }
        format.json { render :show, status: :ok, location: @bet_league }
      else
        format.html { render :edit }
        format.json { render json: @bet_league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bet_leagues/1
  # DELETE /bet_leagues/1.json
  def destroy
    @bet_league.destroy
    respond_to do |format|
      format.html { redirect_to bet_leagues_url, notice: 'Bet league was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_bet_league
    @bet_league = BetLeague.includes(rounds: :games)
                           .find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bet_league_params
    params.require(:bet_league).permit(:name, :description)
  end
end
