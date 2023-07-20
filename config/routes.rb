# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasting, only: [:show]
  resources :taste_sessions do
    resources :samples
  end
  resources :participant_sessions, only: [:new, :create, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
