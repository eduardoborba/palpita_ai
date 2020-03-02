class PlayerBetLeagueForm
  include ActiveModel::Model

  attr_accessor :bet_league_id, :player_ids, :current_players, :bet_league

  def initialize(params = {})
    @bet_league = BetLeague.find(params[:bet_league_id])
    @player_ids = @bet_league.players.map(&:id)
    @params = params
  end

  def submit
    PlayerBetLeague.transaction do
      @players = Player.where(id: @params[:player_ids])
      @bet_league.player_bet_leagues.where.not(player_id: @params[:player_ids]).destroy_all

      @players.each do |player|
        next if @player_ids.include?(player.id)

        @bet_league.player_bet_leagues.create!(player_id: player.id, player_accumulated_score: 0)
      end
    end

    true
  end
end
