Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: 'registrations' }

  scope '(:locale)', locale: /fr|en/ do

    root to: 'pages#home'
    get 'payments/new'

    namespace :account do
      resources :announces
    end

    namespace :account do
      resources :purchases
    end

    get '/cards', to: 'pages#cards'

    resources :purchases, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end

    resources :announces do
      resources :messages,  only: [:create]
      resources :purchases, only: [:new, :create]
    end

    resources :purchases, only: [:show, :index]

    resources :companies, only: [:show, :index, :new, :create]

    resources :users, only: [:show]
  end
end

