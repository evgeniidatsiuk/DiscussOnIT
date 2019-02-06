class Category < ApplicationRecord
  has_many :tags, dependent: :destroy
  validates :name, presence: true
 # validates :name, length: { maximum: 11 }
end
