# frozen_string_literal: true

require 'sidekiq-scheduler'

class CloseBetsWorker
  include Sidekiq::Worker

  def perform
    rounds = Round.open
                  .where('accept_bets_until < ?', Time.zone.now)

    rounds.each(&:closed!)
  end
end
