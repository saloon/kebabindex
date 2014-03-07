Kebabindex::Application.routes.draw do
  get "version", to: 'home#version'

  resources :stores, only: [:new, :create]

  namespace :admin do
    resources :stores do
      post 'approve'
    end
  end

  root to: 'home#index'
end