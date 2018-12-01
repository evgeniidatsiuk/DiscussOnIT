class Post < ApplicationRecord
  belongs_to :user
  has_many :сomments, as: :object
  has_many :tags, as: :object

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
