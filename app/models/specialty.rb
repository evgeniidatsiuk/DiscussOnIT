class Specialty < ApplicationRecord
  has_and_belongs_to_many :university
end
