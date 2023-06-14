# frozen_string_literal: true

class Player < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         :registerable, :confirmable, :lockable, :timeoutable

  has_many :player_bet_leagues, dependent: :destroy
  has_many :bet_leagues, through: :player_bet_leagues
  has_many :player_round_assignments

  enum user_type: { standard: 0, admin: 1 }

  before_create :set_user_type

  private

  def set_user_type
    self.user_type = Player.user_types[:standard] if user_type.blank?
  end
end
