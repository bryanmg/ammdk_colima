Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :teachers, except: [:index] do
    scope module: :teachers do
      resources :students, only: [:index, :show]
      resources :learning_resources
    end
    resources :groups
    resources :attendances
    resources :documents
  end

  resources :students, except: [:index, :create, :destroy]
end
