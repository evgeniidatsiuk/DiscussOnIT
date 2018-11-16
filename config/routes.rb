Rails.application.routes.draw do

	root to: 'pages#index'

  	devise_for :admin_users, ActiveAdmin::Devise.config
  	ActiveAdmin.routes(self)

  	devise_for :users
  	resources :userparams, except:[:index]

  	resources :posts do
  	#	resources :comments, except:[:new,:edit,:show,:index]
  	end
  	#resources :comments, only:[] do 
  	#	resources :comments, except:[:new,:edit,:show,:index]
  	#end

  	resources :comments, except:[:new,:edit,:show,:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
