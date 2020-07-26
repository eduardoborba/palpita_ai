# frozen_string_literal: true

require 'sidekiq-scheduler'

class OpenBetsWorker
  include Sidekiq::Worker

  def perform
    rounds = Round.where(status: Round.statuses['unstarted'])
                  .where('accept_bets_after < ?', Time.zone.now)

    rounds.update_all(status: Round.statuses['started'])
  end
end
