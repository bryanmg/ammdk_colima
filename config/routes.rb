Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  get "/", to: "home#index"

  resources :users do
    resources :groups
    resources :attendances
    resources :documents
  end
end
