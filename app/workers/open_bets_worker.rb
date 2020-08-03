# frozen_string_literal: true

require 'sidekiq-scheduler'

class OpenBetsWorker
  include Sidekiq::Worker

  def perform
    rounds = Round.unstarted
                  .where('accept_bets_after < ?', Time.zone.now)

    rounds.each(&:open!)
  end
end
