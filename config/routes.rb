Rails.application.routes.draw do
  resources :tournaments, only: [:index, :show]
  resources :players, only: [:index, :show]

end
