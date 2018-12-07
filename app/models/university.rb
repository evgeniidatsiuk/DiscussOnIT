class University < ApplicationRecord
  has_and_belongs_to_many :specialty
end
