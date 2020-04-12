class Game < ApplicationRecord
  belongs_to :round
  belongs_to :home, class_name: 'Team'
  belongs_to :visitor, class_name: 'Team'
end
