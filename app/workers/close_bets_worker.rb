# frozen_string_literal: true

require 'sidekiq-scheduler'

class CloseBetsWorker
  include Sidekiq::Worker

  def perform
    rounds = Round.where(status: Round.statuses['started'])
                  .where('accept_bets_until < ?', Time.zone.now)

    rounds.update_all(status: Round.statuses['finished'])
  end
end
