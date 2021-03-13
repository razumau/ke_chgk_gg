Rails.application.routes.draw do
  resources :tournaments, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :teams, only: [:index, :show]
  resources :tournamentteams, only: [:index, :show], :controller => 'tournament_teams'
  resources :editors, only: [:index, :show]
end
