# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get  '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, except: %i[new create]
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get 'sessions_controller/destroy'
  get '/new_event', to: 'events#new'
  post '/new_event', to: 'events#create'
  resources :events, except: %i[new create index]
  get 'events/show'
  get '/events', to: 'events#index'
end
