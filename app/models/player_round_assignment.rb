class PlayerRoundAssignment < ApplicationRecord
  belongs_to :player
  belongs_to :round
  belongs_to :bet_league
  has_many :bets, dependent: :destroy

  accepts_nested_attributes_for :bets, allow_destroy: true

  validates :round, uniqueness: { scope: :player_id, message: 'já palpitada.' }
end
