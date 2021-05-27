class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def block_not_owner
    return if @bet_league.owner == current_player

    redirect_to @bet_league, notice: 'Você não tem permissão para modificar essa liga.'
  end

  def block_not_admin
    return if current_player.admin?

    redirect_to home_index_path, notice: 'Você não tem permissão para criar e modificar ligas.'
  end

  def block_not_participant
    return if @bet_league.player_bet_leagues.exists?(player: current_player)
    return if @bet_league.owner == current_player

    redirect_to home_index_url, notice: 'Você não tem permissão para ver essa liga.'
  end

  def after_sign_out_path_for(resource_or_scope)
    new_player_session_path
  end

  def after_sign_in_path_for(resource)
    home_index_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
