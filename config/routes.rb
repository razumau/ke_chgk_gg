Rails.application.routes.draw do
  resources :tournaments, only: [:index, :show]
  resources :players, only: [:index, :show]
  resources :teams, only: [:index, :show]

end
