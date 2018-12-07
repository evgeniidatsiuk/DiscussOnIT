class Education < ApplicationRecord
  belongs_to :user
  belongs_to :university
  # belongs_to :specialty
end
