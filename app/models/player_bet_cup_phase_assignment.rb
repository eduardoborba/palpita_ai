# frozen_string_literal: true

class PlayerBetCupPhaseAssignment < ApplicationRecord
  belongs_to :player
  belongs_to :bet_cup
  belongs_to :bet_cup_phase
end
