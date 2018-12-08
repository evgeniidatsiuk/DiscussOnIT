class University < ApplicationRecord
  has_many :university_specialties
  has_many :university_specialties, through: :specialties
end
