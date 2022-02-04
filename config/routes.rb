Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :teachers, except: [:index] do
    scope module: :teachers do
      resources :students, only: [:index]
      resources :learning_resources
    end
    resources :groups
    resources :documents
    resources :groups do
      resources :attendances, except: [:edit, :update, :destroy]
    end
    resources :students_learning_resources, only: [:new, :create]
  end

  resources :students, except: [:index, :create, :destroy]
end
