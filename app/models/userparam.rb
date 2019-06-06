class Userparam < ApplicationRecord
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>', ser: '150x150' }, default_url: '/missing.png'
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}

  belongs_to :user

  # has_one :education, dependent: :destroy
  has_many :votes, as: :object, dependent: :destroy

  # validates :firstname, :lastname, :age, presence: { message: "Майже, введіть ще раз дані" }
  validates :age, numericality: { only_integer: true }, allow_nil: true

  def username
    username = user.nickname
    username ||= user.email.split('@').first
  end
end
