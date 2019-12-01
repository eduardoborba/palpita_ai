Rails.application.routes.draw do
  resources :rounds
  resources :teams
  resources :championships
  resources :bets
  resources :bet_leagues
  resources :player_bet_leagues
  resources :games
  devise_for :players

  root to: 'bet_leagues#index'
end
