class UserparamsController < ApplicationController
  before_action :authenticate_user!, except: :show

  def new
    if current_userparam
      redirect_to userparam_path(current_userparam.id)
    else
      userparam
    end
  end

  def create
    unless current_userparam
      userparam = current_user.build_userparam(profile_params)
      if userparam.save
        redirect_to userparam_path(userparam.id)
      else
        render 'new'
      end
    end
  end

  def show
    userparam
  end

  def edit
    redirect_to edit_userparam_path(current_userparam.id) unless isCurrent?
  end

  def update
    if isCurrent? && userparam.update(profile_params)
      redirect_to userparam_path(current_userparam.id)
    else render 'edit'
    end
  end

  private

  def userparam
    @userparam ||= Userparam.find_by(id: params[:id])
    @userparam ||= Userparam.new
  end

  def current_userparam
    @current_userparam ||= current_user.userparam
  end

  def isCurrent?
    @stat ||= (userparam.id == current_userparam.id)
  end

  def profile_params
    params.require(:userparam).permit(:user_id, :avatar, :firstname, :lastname, :age)
  end
end
