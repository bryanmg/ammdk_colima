# rubocop:disable Metrics/BlockLength
Rails.application.routes.draw do
  devise_for :users

  root to: "home#index"

  resources :teachers, except: [:index] do
    scope module: :teachers do
      resources :debts, except: [:edit] do
        scope module: :debts do
          resources :payments
        end
      end
      resources :students
      resources :learning_resources
      resources :reviews, except: [:index]
    end
    resources :groups # TODO: this line seems like is not required
    resources :documents
    resources :groups do
      resources :attendances, except: [:edit, :update, :destroy]
    end
    resources :student_learning_resources, only: [:new, :create]
  end

  resources :students, except: [:index, :create, :destroy] do
    scope module: :students do
      resources :learning_resources, only: [:index]
      resources :attendances, only: [:index]
      resources :reviews, only: [:index]
      resources :student_learning_resources, only: [:index]
    end
  end
end
# rubocop:enable Metrics/BlockLength
