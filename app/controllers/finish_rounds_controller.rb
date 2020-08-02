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
      redirect_to @bet_league, notice: 'Rodada foi editada com sucesso.'
    else
      render :edit
    end
  end

  private

  def round_params
    params.require(:round).permit(
      games_attributes: %i[id home_score visitor_score]
    )
  end
end
