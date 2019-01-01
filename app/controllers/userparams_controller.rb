class UserparamsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @userparam = Userparam.new
    @education = Education.new
  end

  def create
    @userparam = current_user.build_userparam(profile_params)
    @education = @userparam.build_education(education_params)
    if @userparam.save
      redirect_to userparam_path(@userparam.id)
      @education.save
    end
  end

  def show
    @userparam = Userparam.find_by(user_id: params[:id])
  end

  def edit
    @userparam = current_user.userparam
    @education = @userparam.education || Education.new
  end

  def update
    @userparam = Userparam.find_by(user_id: current_user.id)
    if @userparam.update(profile_params)
      if @userparam.education
        @userparam.education.update(education_params)
      else
        @education = @userparam.build_education(education_params)
        @education.save
      end
      redirect_to userparam_path(@userparam.id)
    end
  end

  private

  def profile_params
    params.require(:userparam).permit(:user_id, :avatar, :nickname, :firstname, :lastname, :age)
  end

  def education_params
    params.require(:education).permit(:userparam_id, :university_id, :specialty_id, :begin_year, :end_year)
  end

  def userparam_create; end
end
