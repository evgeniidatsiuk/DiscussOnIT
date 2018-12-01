class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :сomments, as: :object
end
