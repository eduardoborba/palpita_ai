class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :registerable

  has_many :player_bet_leagues, dependent: :destroy
  has_many :bet_leagues, through: :player_bet_leagues
  has_many :player_round_assignments

  enum user_type: [:standard, :admin]
end
