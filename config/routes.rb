Rails.application.routes.draw do
  root to: 'pages#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :userparams, except: [:index]
  resources :comments, except: %i[new edit show index]
  resources :questions
  resources :answers, except: %i[index show] do
    member do
      get :right
    end
  end
  resources :posts
  resources :categories, only: %i[index show]
  resources :notifications, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
