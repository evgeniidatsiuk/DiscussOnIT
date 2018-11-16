class UserparamsController < ApplicationController
  before_action :authenticate_user!

 def index
  
 end
  def new
    @userparam = Userparam.new
  end
  
  def create
    @userparam = current_user.build_userparam(profile_params)
    if @userparam.save
      redirect_to userparam_path(@userparam.id)
    end
    
  end
  
  def show
    @userparam = Userparam.find_by(user_id: current_user.id)
  end
  
  def edit
    @userparam = current_user.userparam
  end
  
  def update
    @userparam = Userparam.find_by(user_id: current_user.id)
    if @userparam.update(profile_params)
       redirect_to userparam_path(@userparam.id)
    end
    
  end
  
private

  def profile_params
    params.require(:userparam).permit(:user_id,:avatar, :firstname, :lastname, :age)
  end
  
end
