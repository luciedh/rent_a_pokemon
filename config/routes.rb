Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :users, only: [:show, :edit, :update]
  resources :pokemons, only: %i[index show update] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index show edit update destroy]
  get 'users/:id/team', to: 'pokemons#edit', as: "team"
end
