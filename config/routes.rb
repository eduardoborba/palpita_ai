Rails.application.routes.draw do
  resources :player_round_assignments, only: [:new, :edit, :create, :update, :show]
  resources :rounds, only: [:new, :edit, :create, :update, :destroy]
  resources :finish_rounds, only: [:edit, :update]
  resources :bet_leagues
  resources :player_bet_leagues, only: [:new, :create]
  resources :home, only: [:index]
  devise_for :players

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'home#index'
end
