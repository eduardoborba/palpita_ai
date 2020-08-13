class PlayerRoundAssignmentsController < ApplicationController
  before_action :set_player_round_assignment, only: %i[show edit update]
  before_action :set_round, only: %i[new create]
  before_action :block_not_participant
  before_action :block_round_not_open, only: %i[new edit create update]

  def show; end

  def new
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

  def edit; end

  def create
    @player_round_assignment = PlayerRoundAssignment.new
    @player_round_assignment.attributes = player_round_assignment_params

    if @player_round_assignment.save
      redirect_to @bet_league, notice: 'Palpite salvo com sucesso.'
    else
      render :new
    end
  end

  def update
    if @player_round_assignment.update(player_round_assignment_params)
      redirect_to @bet_league, notice: 'Palpite salvo com sucesso.'
    else
      render :edit
    end
  end

  private

  def block_round_not_open
    if @round.unstarted?
      redirect_to @bet_league, notice: 'Os palpites para essa rodada ainda não começaram.'
    elsif @round.closed? || @round.finished?
      redirect_to @bet_league, notice: 'Os palpites para essa rodada já acabaram.'
    end
  end

  def set_player_round_assignment
    @player_round_assignment = PlayerRoundAssignment.find(params[:id])
    @round = @player_round_assignment.round
    @bet_league = @player_round_assignment.bet_league
  end

  def set_round
    round_id = params[:round_id] || player_round_assignment_params[:round_id]
    @round = Round.find(round_id)
    @bet_league = @round.bet_league
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
