class Report < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.
  validates :user_email,:text,:subject, presence: { message: "Something is wrong. Майже, введіть ще раз дані" }
end
