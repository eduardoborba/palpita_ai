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
    @player_round_assignment = PlayerRoundAssignment.new
  end

  # GET /player_round_assignments/1/edit
  def edit
  end

  # POST /player_round_assignments
  # POST /player_round_assignments.json
  def create
    @player_round_assignment = PlayerRoundAssignment.new(player_round_assignment_params)

    respond_to do |format|
      if @player_round_assignment.save
        format.html { redirect_to @player_round_assignment, notice: 'Player round assignment was successfully created.' }
        format.json { render :show, status: :created, location: @player_round_assignment }
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
        format.html { redirect_to @player_round_assignment, notice: 'Player round assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_round_assignment }
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
    # Use callbacks to share common setup or constraints between actions.
    def set_player_round_assignment
      @player_round_assignment = PlayerRoundAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_round_assignment_params
      params.require(:player_round_assignment).permit(:bet_league_id, :player_id, :round_id)
    end
end
