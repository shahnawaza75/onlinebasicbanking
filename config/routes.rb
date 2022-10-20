Rails.application.routes.draw do
  resources :transfers, only: [:index, :new, :create]
  resources :customers, only: [:home, :index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "customers#home"
  
end
