Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static#home'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#login"
  get '/logout', to: "sessions#destroy", as: "logout"
  
  resources :events, :users, :comments
  
  resources :events, only: [:show] do 
    resources :comments, only: [:show] 
  end
  
  resources :users, only:[:show] do 
    resources :events
  end
  
end
