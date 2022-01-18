Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"
  get "/", to: "dashboard#index"

  resources :documents
  resources :attendances
  resources :groups
end
