class ChosensController < ApplicationController
  before_action :get_object, only: [:chose]

  def chose
    Chosen.chose(current_user, @object)
    redirect_back(fallback_location: root_path)
  end

  def index
    @posts = Post.where(id: current_user.chosens.where(object_type: 'Post').collect(&:object_id))
    @questions = Question.where(id: current_user.chosens.where(object_type: 'Question').collect(&:object_id))
  end

  private

  def get_object
    @object = params[:type].constantize.find(params[:id])
  end
end
