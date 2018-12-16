class Specialty < ApplicationRecord
  has_many :educations
  has_many :university_specialties
  has_many :universities, through: :university_specialties
end
