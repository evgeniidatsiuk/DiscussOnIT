class VotesController < ApplicationController
  before_action :authenticate_user!
  after_action :object_update

  def positiv_vote
    vote.update(score: 1)
    redirect_back(fallback_location: root_path)
  end

  def negativ_vote
    vote.update(score: -1)
    redirect_back(fallback_location: root_path)
  end

  private

  def object
    @object = params[:type].constantize.find(params[:id])
  end

  def object_update
    object.update(score: object.votes.sum(:score))
  end

  def vote
    @vote ||= Vote.where(user_id: current_user.id, object_type: object.class.name, object_id: object.id).first_or_create!
  end
end
