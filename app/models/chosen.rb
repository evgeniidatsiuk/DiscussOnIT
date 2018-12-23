class Chosen < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  def self.chose(user, object)
    @chosen = Chosen.find_by(user_id: user.id, object_type: object.class.name, object_id: object.id)
    if @chosen
      @chosen.destroy
    else
      @chosen = Chosen.create(user_id: user.id, object_type: object.class.name, object_id: object.id)
    end
  end
end
