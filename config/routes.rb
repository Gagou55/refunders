Rails.application.routes.draw do


  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :announces do
    resources :purchases, only: [:new, :create]
  end
  resources :companies, only: [:show, :index, :new]
end

