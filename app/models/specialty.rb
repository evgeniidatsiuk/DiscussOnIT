class Specialty < ApplicationRecord
  has_many :educations, dependent: :destroy
  has_many :university_specialties, dependent: :destroy
  has_many :universities, through: :university_specialties, dependent: :destroy
end
