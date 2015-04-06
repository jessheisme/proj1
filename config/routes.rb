Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemons

  patch 'capture', to: 'pokemons#capture'
  patch 'damage', to: 'pokemons#damage'

  post 'pokemons', to: 'pokemons#create'
  get 'pokemons/new', to: 'pokemons#new'
end
