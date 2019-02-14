Rails.application.routes.draw do
  
  resources :games
  resources :players

  get 'play/index'
  get 'welcome/index'
  
  root 'welcome#index'
end
