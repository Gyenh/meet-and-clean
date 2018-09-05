# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_pages#index'

  resources :events

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }
  # exemple : http://localhost:3000/admins/sign_in

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }
  # exemple : http://localhost:3000/users/sign_in

  resources :mobs
end
