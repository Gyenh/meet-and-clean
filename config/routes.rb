# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_pages#index'

  resources :events

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions' }
  # path example : http://localhost:3000/admins/sign_in

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions' }
  # path example : http://localhost:3000/users/sign_in

  resources :mobs

end
