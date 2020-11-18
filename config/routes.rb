Rails.application.routes.draw do
  # root to: 'oauth_test#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users, only: [:show]
  resources :favorites, only: [:create, :destroy]
  resources :reviews
  resources :stores
  root to: "stores#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
