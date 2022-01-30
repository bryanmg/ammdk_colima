Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :teachers, except: [:index] do
    get "/students", to: "teachers#show_students", as: "students"
    resources :groups
    resources :attendances
    resources :documents
  end

  resources :students, except: [:index, :create, :destroy]
end
