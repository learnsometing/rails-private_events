# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#new'
  get  '/signup', to: 'users#new'
  resources :users, except: %i[new]
  get  '/login', to: 'users#login_page' 
  post '/login', to: 'users#login'
end
