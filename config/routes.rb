Rails.application.routes.draw do
  get 'admin/index'

  get 'admin/update'

  devise_for :users,  controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  get 'listings/markers'
  get 'listings/search'
  get "admin" => "admin#index"
  put "admin/:id" => "admin#update"
  patch "admin/:id" => "admin#update"
  resources :listings

  root 'listings#index'
end
