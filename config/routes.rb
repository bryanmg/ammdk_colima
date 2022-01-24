Rails.application.routes.draw do
  devise_for :users

  root "dashboard#index"
  get "/", to: "dashboard#index"

  resources :users do
    resources :documents
    resources :groups do
      resources :attendances
    end
  end
end
