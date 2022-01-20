Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'     
  jsonapi_resources :users 
  jsonapi_resources :articles

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'authenticate', to: 'authentication#authenticate'
  # resources :articles docd 
  #   resources :categories
  # end
  #namespace :admin do
  jsonapi_resources :categories
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
