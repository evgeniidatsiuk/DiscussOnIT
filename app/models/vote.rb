class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  def self.positiv(user, object)
    Vote.where(user_id: user.id, object_type: object.class.name, object_id: object.id).first_or_create!.update(score: 1)
  end

  def self.negativ(user, object)
    Vote.where(user_id: user.id, object_type: object.class.name, object_id: object.id).first_or_create!.update(score: -1)
  end
end
