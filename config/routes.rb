Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get 'listings/markers'
  get 'listings/search'
  resources :listings

  root 'listings#index'
end
