class VotesController < ApplicationController
  before_action :get_object

  def positiv_vote
    Vote.positiv(current_user, @object)
    redirect_back(fallback_location: root_path)
  end

  def negativ_vote
    Vote.negativ(current_user, @object)
    redirect_back(fallback_location: root_path)
  end

  private

  def get_object
    @object = params[:type].constantize.find(params[:id])
  end
end
