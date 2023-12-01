# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :decision_engine_api do
    resources :loan_applications, only: :create
  end
  resources :loan_applications do
    member do
      post 'submit_application'
    end
  end
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
