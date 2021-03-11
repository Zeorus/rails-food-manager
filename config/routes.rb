Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'dashboard', to: 'pages#dashboard'

  resources :customers

  resources :orders, except: [:edit]

  resources :products

<<<<<<< HEAD
  resources :categories
=======
  resources :categories, only: [:create]
  
>>>>>>> 9c48df20032ad5c5356e56ea3e881a74b0523e5d
end
