class HomeController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_player!

  def index
    @bet_leagues = current_player.bet_leagues
                                 .order(created_at: :asc)
  end
end
