Rails.application.routes.draw do
  root 'tournaments#index'
  resources :tournaments, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :teams, only: [:index, :show]
  resources :tournamentteams, only: [:index, :show], :controller => 'tournament_teams'
  resources :editors, only: [:index, :show]
  resources :medals, only: :index
end
