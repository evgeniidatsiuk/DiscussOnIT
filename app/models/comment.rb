class Comment < ApplicationRecord
  after_create :create_notification

  belongs_to :object, polymorphic: true, dependent: :destroy
  belongs_to :user
  has_many :comments, as: :object

  def url
    root.url + '/#comments_' + id.to_s
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

  def rooter
    object.class.name != 'Comment'
  end

  def create_notification
    nots = Notification.generate(object.user, self, 'create', user)
    # User.find(nots.activeuser_id).userparam
  end
end
