Rails.application.routes.draw do
  resources :rounds
  resources :teams
  resources :championships
  resources :bets
  resources :bet_leagues
  resources :player_bet_leagues, only: [:new, :create]
  resources :home, only: [:index]
  devise_for :players

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'
end
