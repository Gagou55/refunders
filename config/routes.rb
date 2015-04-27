Rails.application.routes.draw do


  devise_for :users

  resources :announces do
    resources :purchases, only: [:new, :create]
  end
  resources :companies, only: [:show]
end
