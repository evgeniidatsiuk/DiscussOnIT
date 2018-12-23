class ChosensController < ApplicationController
  before_action :get_object

  def chose
    Chosen.chose(current_user, @object)
    redirect_back(fallback_location: root_path)
  end

  private

  def get_object
    @object = params[:type].constantize.find(params[:id])
  end
end
