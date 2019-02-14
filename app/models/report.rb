class Report < ApplicationRecord
  mount_uploaders :photos, PhotoUploader
  serialize :photos, JSON # If you use SQLite, add this line.
  validates :user_email, presence: { message: "Something is wrong. Майже, введіть ще раз дані" }
  validates :text, presence: { message: "Something is wrong. Майже, введіть ще раз дані" }

end
