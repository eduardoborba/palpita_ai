class PlayerRoundAssignmentsController < ApplicationController
  before_action :set_player_round_assignment, only: [:show, :edit, :update, :destroy]

  # GET /player_round_assignments
  # GET /player_round_assignments.json
  def index
    @player_round_assignments = PlayerRoundAssignment.all
  end

  # GET /player_round_assignments/1
  # GET /player_round_assignments/1.json
  def show
  end

  # GET /player_round_assignments/new
  def new
    @round = Round.find(params[:round_id])
    @bet_league = @round.bet_league
    @player_round_assignment = PlayerRoundAssignment.new(
      round: @round,
      player: current_player,
      bet_league: @bet_league
    )

    @player_round_assignment.bets = @round.games.map do |game|
      Bet.new(
        game: game,
        player: current_player,
        bet_league: @bet_league
      )
    end
  end

  # GET /player_round_assignments/1/edit
  def edit
  end

  # POST /player_round_assignments
  # POST /player_round_assignments.json
  def create
    @player_round_assignment = PlayerRoundAssignment.new
    @player_round_assignment.attributes = player_round_assignment_params

    @round = @player_round_assignment.round
    @bet_league = @player_round_assignment.bet_league

    respond_to do |format|
      if @player_round_assignment.save
        format.html { redirect_to @bet_league, notice: 'Palpite salvo com sucesso.' }
        format.json { render :show, status: :created, location: @bet_league }
      else
        format.html { render :new }
        format.json { render json: @player_round_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player_round_assignments/1
  # PATCH/PUT /player_round_assignments/1.json
  def update
    respond_to do |format|
      if @player_round_assignment.update(player_round_assignment_params)
        format.html { redirect_to @bet_league, notice: 'Palpite salvo com sucesso.' }
        format.json { render :show, status: :created, location: @bet_league }
      else
        format.html { render :edit }
        format.json { render json: @player_round_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player_round_assignments/1
  # DELETE /player_round_assignments/1.json
  def destroy
    @player_round_assignment.destroy
    respond_to do |format|
      format.html { redirect_to player_round_assignments_url, notice: 'Player round assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_player_round_assignment
    @player_round_assignment = PlayerRoundAssignment.find(params[:id])
    @round = @player_round_assignment.round
    @bet_league = @player_round_assignment.bet_league
  end

  def player_round_assignment_params
    params.require(:player_round_assignment).permit(
      :bet_league_id, :player_id, :round_id,
      bets_attributes: [
        :id, :game_id, :player_id, :bet_league_id,
        :player_round_assignment_id, :home_bet, :visitor_bet
      ]
    )
  end
end
