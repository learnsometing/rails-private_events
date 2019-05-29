# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions_controller/new'
  get 'sessions_controller/create'
  get 'sessions_controller/destroy'
  root 'users#new'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, except: %i[new create]
  get  '/login', to: 'sessions#new' 
  post '/login', to: 'sessions#create'
end
