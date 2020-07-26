class RoundsController < ApplicationController
  before_action :set_round, only: %i[show destroy]
  before_action :authenticate_player!

  # GET /rounds/1
  # GET /rounds/1.json
  def show; end

  # GET /rounds/new
  def new
    @bet_league = BetLeague.find(params[:bet_league_id])
    @round = @bet_league.rounds.build(accept_bets_after: Time.zone.now, accept_bets_until: 1.week.from_now)
    1.times { @round.games.build }
  end

  # # GET /rounds/1/edit
  def edit
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @bet_league = BetLeague.find(round_params[:bet_league_id])
    @round = @bet_league.rounds.build
    @round.attributes = round_params

    respond_to do |format|
      if @round.save
        format.html do
          redirect_to @bet_league,
                      notice: 'Rodada foi criada com sucesso.'
        end
        format.json do
          render :show,
                 status: :created,
                 location: @round
        end
      else
        format.html { render :new }
        format.json do
          render json: @round.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # # PATCH/PUT /rounds/1
  # # PATCH/PUT /rounds/1.json
  def update
    @round = Round.find(params[:id])
    @bet_league = @round.bet_league
    @round.attributes = round_params

    respond_to do |format|
      if @round.save
        format.html { redirect_to @bet_league, notice: 'Rodada foi editada com sucesso.' }
        format.json { render :show, status: :ok, location: @round }
      else
        format.html { render :edit }
        format.json { render json: @round.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy
    respond_to do |format|
      format.html do
        redirect_to rounds_url,
                    notice: 'Round was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  def set_round
    @round = Round.find(params[:id])
  end

  def round_params
    params.require(:round).permit(
      :bet_league_id,
      :accept_bets_after,
      :accept_bets_until,
      games_attributes: %i[id home_id visitor_id _destroy]
    )
  end
end
