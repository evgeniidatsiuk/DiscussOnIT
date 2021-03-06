class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true
  belongs_to :activeuser, class_name: 'User'

  scope :unread, -> { where(read_at: nil) }

  def self.generate(user, object, action, activeuser)
    if user != activeuser
      Notification.where(user_id: user.id, object_type: object.class.name, object_id: object.id, action: action, activeuser_id: activeuser.id).first_or_create!
    end
  end

  def write
    [action, object.class.name].join(' ')
  end

  def root
    if object_type == 'Answer'
      object.question
    else
      if object_type == 'Comment'
        object.root
      else
        object
      end
    end
  end
end
