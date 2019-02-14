Rails.application.routes.draw do
  
  resources :games
  resources :players

  resources :roulettes
  resources :rounds

  get 'welcome/index'
  
  root 'welcome#index'
end
