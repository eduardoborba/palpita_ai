Rails.application.routes.draw do
  resources :player_round_assignments, only: %i[new edit create update show]
  resources :rounds, only: %i[show new edit create update destroy]
  resources :finish_rounds, only: %i[edit update]
  resources :bet_leagues
  resources :player_bet_leagues, only: %i[new create]
  resources :home, only: %i[index]
  resources :how_it_works, only: %i[index]
  resources :landing_page, only: %i[index]
  devise_for :players

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'landing_page#index'
end
