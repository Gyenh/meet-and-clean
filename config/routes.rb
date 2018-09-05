Rails.application.routes.draw do
  resources :events
  devise_for :admins
  devise_for :users
  resources :mobs
  root 'home_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
