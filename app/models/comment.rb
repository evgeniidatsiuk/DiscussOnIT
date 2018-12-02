class Comment < ApplicationRecord
  after_create :create_notification

  belongs_to :object, polymorphic: true
  belongs_to :user
  has_many :сomments, as: :object

  def create_notification
    nots = Notification.generate(object.user, self, 'create', user)
    # User.find(nots.activeuser_id).userparam
  end
end
