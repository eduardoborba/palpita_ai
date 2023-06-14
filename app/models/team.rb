# frozen_string_literal: true

class Team < ApplicationRecord
  scope :active, -> { where(active: true) }
end
