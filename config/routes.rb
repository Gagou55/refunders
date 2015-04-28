Rails.application.routes.draw do


  ActiveAdmin.routes(self)
  devise_for :users

  resources :announces do
    resources :purchases, only: [:new, :create]
  end
  resources :companies, only: [:show, :index, :new]
end
