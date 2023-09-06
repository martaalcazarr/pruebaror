Rails.application.routes.draw do
  resources :maintenances
  resources :materials
  resources :cities
  resources :motors
  resources :maintenance_types
  resources :equipment_types
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/pages/terms', to: 'pages#terms', as: 'terms'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "pages#home"
end
