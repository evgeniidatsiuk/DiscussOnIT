class Question < ApplicationRecord
  belongs_to :user
  has_many :сomments, as: :object
  has_many :tags, as: :object
end
