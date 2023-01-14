Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  resources :pokemons, only: %i[index show new create]
  resources :bookings, only: %i[index show new create]
end
