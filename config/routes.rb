Rails.application.routes.draw do
  
  resources :games
  resources :players

  resources :roulettes
  resources :rounds

  match "*path", to: "application#index", via: :all

  get 'welcome/index'
  
  root 'roulettes#index'
end
