# frozen_string_literal: true

Rails.application.routes.draw do

  root 'home_pages#index'

  devise_for :admins, path: 'admins', controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  # path example : http://localhost:3000/admins/sign_in

  devise_for :users, path: 'users', controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  # path example : http://localhost:3000/users/sign_in

<<<<<<< HEAD
=======
  resources :user_events

  resources :events

>>>>>>> 8990baac7850bef0a05093416a21f4b0ff0cfe88
  resources :mobs


end
