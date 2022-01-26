Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"
  get "/", to: "home#index"

  resources :users do
    resources :documents
    resources :groups do
      resources :attendances
    end
  end
end
