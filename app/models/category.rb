class Category < ApplicationRecord
<<<<<<< HEAD
  has_many :tags

=======
  has_many :tags, dependent: :destroy
>>>>>>> 325cba567156f71d219ce42e0b58ba577701d4a9
  validates :name, presence: true
end
