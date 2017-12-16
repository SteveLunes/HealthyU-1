Rails.application.routes.draw do
  get 'users/new'
  get    '/about',   to: 'homepage#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users

  get 'sessions/new'
  
  get 'homepage/index'
  resources :exercises

  resources :aboutus

  resources :nutritions
  root 'homepage#index'
end