Rails.application.routes.draw do
  root to: 'sessions#new'


  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :new, :create]
  
  resources :places, only: [:show, :new, :create, :destroy] do
    member do
      patch "gones"
    end
  end
  
end
