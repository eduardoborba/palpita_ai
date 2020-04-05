class RoundForm
  include ActiveModel::Model

  attr_accessor :bet_league_id, :round, :games, :teams, :blocked_after

  def initialize(params = {})
    @params = params
    @bet_league_id = params[:bet_league_id]
    @bet_league = BetLeague.find(@bet_league_id)
    @teams = Team.order(name: :asc)
  end

  def submit
    Round.transaction do
      binding.pry
      @round = Round.new(bet_league: @bet_league)
      @round.round_number = round_number if @round.new_record?
      @round.status = 'unstarted' if @round.new_record?
      @round.blocked_after = @params[:blocked_after]
      @round.number_of_games = @params[:games].count
      @round.save!

      @params[:games].each_with_index do |game_params, index|
        Game.create!(
          home_id: game_params[:home_id],
          visitor_id: game_params[:visitor_id],
          round_id: @round.id,
          bet_league_id: @bet_league.id,
          position: index + 1
        )
      end
    end

    true
  end

  private

  def round_number
    highest_round_number = @bet_league.rounds
                                      .select('max(round_number) as max_round_number')
                                      .take
                                      .try(:max_round_number)
    highest_round_number ||= 0

    highest_round_number + 1
  end

end
