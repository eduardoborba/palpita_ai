# frozen_string_literal: true

class BetLeaguesController < ApplicationController
  before_action :set_bet_league, only: %i[show edit update destroy]
  before_action :authenticate_player!
  before_action :block_not_owner, only: %i[edit update destroy]
  before_action :block_not_admin, only: %i[new create edit update destroy]
  before_action :block_not_participant, only: %i[show]

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
      redirect_to @bet_league, notice: 'Liga foi atualizada com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @bet_league.destroy
    redirect_to bet_leagues_url, notice: 'Liga foi destruída com sucesso.'
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
