class Education < ApplicationRecord
  belongs_to :userparam
  belongs_to :university
  belongs_to :specialty
end
