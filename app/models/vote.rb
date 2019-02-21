class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  def self.positiv(user, object)
    vote = Vote.where(user_id: user.id, object_type: object.class.name, object_id: object.id).first_or_create!
    vote.update(score: 1)
    vote.object.update(score: vote.object.votes.sum(:score))
  end

  def self.negativ(user, object)
    vote = Vote.where(user_id: user.id, object_type: object.class.name, object_id: object.id).first_or_create!
    vote.update(score: -1)
    vote.object.update(score: vote.object.votes.sum(:score))
  end

  def object
    object_type.constantize.find(object_id)
  end
end
