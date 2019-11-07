Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :events, :users, :comments
  
  resources :events, only: [:show] do 
    resources :comments, only: [:show] 
  end
  
  resources :users, only:[:show] do 
    resources :events
  end
  
end
