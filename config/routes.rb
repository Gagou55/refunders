Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  namespace :account do
    resources :announces
  end

  resources :announces do
    resources :purchases, only: [:new, :create]
  end
  resources :companies, only: [:show, :index, :new]

  resources :users, only: [:show, :update, :edit]
end

