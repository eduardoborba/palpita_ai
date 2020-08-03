class FinishRoundsController < ApplicationController
  before_action :authenticate_player!

  def edit
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
  end

  def update
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
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

  def round_params
    params.require(:round).permit(
      :status, games_attributes: %i[id home_score visitor_score]
    )
  end
end
