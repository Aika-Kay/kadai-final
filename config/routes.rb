Rails.application.routes.draw do
  root to: 'users#show'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create]
end
