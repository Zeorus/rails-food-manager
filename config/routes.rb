Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'dashboard', to: 'pages#dashboard'

  resources :customers, only: [:index]

  resources :orders, only: [:index]

  resources :products, only: [:index]
end
