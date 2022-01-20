Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'     
  resources :users, except: [:new] 
  resources :articles, except: [:destroy] 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'authenticate', to: 'authentication#authenticate'
  # resources :articles docd 
  #   resources :categories
  # end
  #namespace :admin do
  resources :categories, except: [:destroy]
  #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
