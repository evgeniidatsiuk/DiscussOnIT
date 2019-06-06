class ChosensController < ApplicationController
  before_action :authenticate_user!

  def chose
    Chosen.chose(current_user, object)
    redirect_back(fallback_location: root_path)
  end

  def index
    posts.where(id: chosens('Post'))
    questions.where(id: chosens('Question'))
  end

  private

  def object
    @object ||= params[:type].constantize.find(params[:id])
  end

  def chosens(name)
    current_user.chosens.where(object_type: name).collect(&:object_id)
  end
end
