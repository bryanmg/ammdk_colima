Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :teachers, except: [:index] do
    resources :groups
    resources :attendances
    resources :documents
  end

  resources :students, except: [:index, :create, :destroy]
end
