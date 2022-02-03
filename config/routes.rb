Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :teachers, except: [:index] do
    scope module: :teachers do
      resources :students, only: [:index]
      resources :learning_resources
    end
    resources :groups
    resources :attendances
    resources :documents
    resources :students_learning_resources, only: [:new, :create]
  end

  resources :students, except: [:index, :create, :destroy]
end
