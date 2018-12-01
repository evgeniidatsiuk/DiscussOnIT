class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  def self.generate(user, object, action, activeuser)
    if user != activeuser
      Notification.where(user_id: user.id, object_type: object.class.name, object_id: object.id, action: action, activeuser_id: activeuser.id).first_or_create!
    end
  end
end
