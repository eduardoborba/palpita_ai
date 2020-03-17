class RoundForm
  include ActiveModel::Model

  attr_accessor :bet_league_id, :round, :games

  def initialize(round:)
    @round = round
    @bet_league = round.bet_league
  end

  def submit(params = {})
    Round.transaction do
      @round.round_number = round_number if @round.new_record?
      @round.status = 'unstarted' if @round.new_record?
      @round.number_of_games = params[:games].count
      @round.save!

      params[:games].each_with_index do |game_params, index|
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
