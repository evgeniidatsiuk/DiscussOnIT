Rails.application.routes.draw do

  root to: 'pages#index'

  namespace :pages do
    post :search
    get :search
  end

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
  resources :notifications, only: [:index] do
    member do
      get :read
      get :unread
    end
  end
  resources :chosens, only: [:index]
  resources :reports

  get '/:type/:id/chose', to: 'chosens#chose', as: 'chose'

  get '/:type/:id/positiv_vote', to: 'votes#positiv_vote', as: 'positiv_vote'
  get '/:type/:id/negativ_vote', to: 'votes#negativ_vote', as: 'negativ_vote'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
