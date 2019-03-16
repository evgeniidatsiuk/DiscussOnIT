class UserparamsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_userparam, except: %i[new create]
  # def index; end

  def new
    if current_user.userparam
      redirect_to userparam_path(current_user.userparam.id)
    else
      @userparam = Userparam.new
    end
  end

  def create
    unless current_user.userparam
      @userparam = current_user.build_userparam(profile_params)
      if @userparam.save
        redirect_to userparam_path(@userparam.id)
      else
        render 'new'
      end
    end
  end

  def show; end

  def edit
    unless @userparam.id == current_user.userparam.id
      redirect_to edit_userparam_path(current_user.userparam.id)
    end
  end

  def update
    if @userparam.id == current_user.userparam.id && @userparam.update(profile_params)
      redirect_to userparam_path(current_user.id)
    else render 'edit'
    end
  end

  private

  def find_userparam
    @userparam = Userparam.find(params[:id])
  end

  def profile_params
    params.require(:userparam).permit(:user_id, :avatar, :firstname, :lastname, :age)
  end
end
