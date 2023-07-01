# frozen_string_literal: true

class PlayerRoundAssignment < ApplicationRecord
  belongs_to :player_bet_league
  belongs_to :round
  belongs_to :bet_match, optional: true
  has_many :bets, dependent: :destroy

  accepts_nested_attributes_for :bets, allow_destroy: true

  validates :round, uniqueness: { scope: :player_bet_league_id, message: 'já palpitada.' }
  validates_associated :bets
end
