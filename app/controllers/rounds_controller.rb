class RoundsController < ApplicationController
  before_action :set_round, only: %i[show destroy]
  before_action :authenticate_player!

  # GET /rounds/1
  # GET /rounds/1.json
  def show; end

  # GET /rounds/new
  def new
    @round_form = RoundForm.new(bet_league_id: params[:bet_league_id])
  end

  # # GET /rounds/1/edit
  # def edit
  # end

  # POST /rounds
  # POST /rounds.json
  def create
    @round_form = RoundForm.new(round_params)

    respond_to do |format|
      if @round_form.submit
        format.html do
          redirect_to @round_form.round,
                      notice: 'Rodada foi criada com sucesso.'
        end
        format.json do
          render :show,
                 status: :created,
                 location: @round_form.round
        end
      else
        format.html { render :new }
        format.json do
          render json: @round_form.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  # # PATCH/PUT /rounds/1
  # # PATCH/PUT /rounds/1.json
  # def update
  #   respond_to do |format|
  #     if @round.update(round_params)
  #       format.html { redirect_to @round, notice: 'Round was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @round }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @round.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

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
    params.require(:round_form).permit(
      :bet_league_id, :number_of_games, :blocked_after,
      games: %i[home_id visitor_id]
    )
  end
end
