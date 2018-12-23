class University < ApplicationRecord
  has_many :educations, dependent: :destroy
  has_many :university_specialties, dependent: :destroy
  has_many :specialties, through: :university_specialties, dependent: :destroy
end
