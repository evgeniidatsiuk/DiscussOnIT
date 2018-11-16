class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :userparam_create 

  private

  def userparam_create
  	if(user_signed_in?)
  		if(!current_user.userparam)
  			redirect_to new_userparam_path
  		end
	end
  end
  
end
