Rails.application.routes.draw do
  
  resources :players

  get 'play/index'
  get 'welcome/index'
  
  root 'welcome#index'
end
