Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: [:show]
  resources :stores
  root to: "stores#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
