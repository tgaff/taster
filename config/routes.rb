# frozen_string_literal: true

Rails.application.routes.draw do
  get 'static/home'
  namespace :tasting do
    get 'flavor_ratings/update'
  end
  # setting up a tasting session:
  resources :taste_sessions do
    resources :samples
  end
  resources :participant_sessions, only: [:new, :create]
  delete 'participant_sessions', to: 'participant_sessions#destroy', as: 'logout_participant_session'
  # actually doing a tasting session
  resources :tasting, only: [:show]

  resources :samples, only: [:show], controller: 'tasting/samples' do
    # resources :flavor_ratings, only: [:update], controller: 'tasting/flavor_ratings', as: 'flavor_ratings'
    put 'flavor_ratings', to: 'tasting/flavor_ratings#update', as: 'flavor_ratings'
    member do
      get 'results'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "static#home"
end
