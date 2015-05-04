Rails.application.routes.draw do

  root to: 'pages#home'

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }

  namespace :account do
    resources :announces
  end

  namespace :account do
    resources :purchases
  end

  resources :announces do
    resources :messages,  only: [:create]
    resources :purchases, only: [:new, :create]
  end

  resources :purchases, only: [:show, :index]

  resources :companies, only: [:show, :index, :new, :create]

  resources :users, only: [:show]

end

