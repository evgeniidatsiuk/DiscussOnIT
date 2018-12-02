class Comment < ApplicationRecord
  after_create :create_notification

  belongs_to :object, polymorphic: true
  belongs_to :user
  has_many :сomments, as: :object

  def url
    ['', root.class.name.downcase + 's', root.id.to_s + '#comment_' + id.to_s].join('/')
  end

  def root
    @st = object
    @st = @st.object while @st.class.name == 'Comment'
  end

  def rooter
    objec.object.class.name != 'Comment'
  end

  def create_notification
    nots = Notification.generate(object.user, self, 'create', user)
    # User.find(nots.activeuser_id).userparam
  end
end
