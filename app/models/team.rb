class Team < ApplicationRecord
  scope :active, -> { where(active: true) }
end
