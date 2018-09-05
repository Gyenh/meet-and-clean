Rails.application.routes.draw do
  resources :mobs
  resources :events
  root 'home_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
