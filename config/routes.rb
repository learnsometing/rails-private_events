# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/invitations', to: 'users#check_invites'
  patch '/invitations', to: 'users#respond_to_invites'
  resources :users, except: %i[new create index]
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :events, only: %i[create show]
  get '/events', to: 'events#index'
  get '/invite', to: 'events#edit'
  patch '/invite', to: 'events#update'
  resources :rsvps, only: %i[edit update]
end
