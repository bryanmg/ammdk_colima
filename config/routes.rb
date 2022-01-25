Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"
  get "/", to: "dashboard#index"

  resources :users do
    resources :groups
    resources :attendances
    resources :documents
  end
end
