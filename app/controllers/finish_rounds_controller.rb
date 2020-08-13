class FinishRoundsController < ApplicationController
  before_action :authenticate_player!
  before_action :set_bet_league
  before_action :block_not_owner, only: %i[edit update]
  before_action :block_round_not_closed

  def edit; end

  def update
    @round.attributes = round_params

    if @round.save
      FinishRoundWorker.perform_async(@round.id)
      redirect_to @bet_league,
        notice: 'Rodada foi finalizada com sucesso. As pontuações podem levar alguns minutos para serem atualizadas
                 corretamente.'
    else
      render :edit
    end
  end

  private

  def block_round_not_closed
    if @round.unstarted?
      redirect_to @bet_league, notice: 'Os palpites para essa rodada ainda não começaram.'
    elsif @round.open?
      redirect_to @bet_league, notice: 'Os palpites para essa rodada ainda estão abertos.'
    end
  end

  def set_bet_league
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
  end

  def round_params
    params.require(:round).permit(
      :status, games_attributes: %i[id home_score visitor_score]
    )
  end
end
