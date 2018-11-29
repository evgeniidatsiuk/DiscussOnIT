class Userparam < ApplicationRecord
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: '/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :user

  validates :nickname, presence: true
end
