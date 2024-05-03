Rails.application.routes.draw do
  get 'dashboard/index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]

  # Define a new route for the page where you want to display all user emails
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  # config/routes.rb
  delete '/users', to: 'users#destroy', as: 'delete_users'
  root 'sessions#new'
end
