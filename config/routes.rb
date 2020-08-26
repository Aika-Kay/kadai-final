Rails.application.routes.draw do
  root to: 'users#show'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  post '/places/:id/gone', to: 'places#gone'
  resources :users, only: [:show, :new, :create]
  
  resources :places, only: [:show, :new, :create, :destroy] do
    member do
      patch "gones"
    end
  end
  
end
