class Post < ApplicationRecord
    belongs_to :user 
    has_many :сomments, as: :object
end
