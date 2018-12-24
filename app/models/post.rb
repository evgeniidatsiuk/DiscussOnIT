class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy
  has_many :votes, as: :object, dependent: :destroy
  self.per_page = 15
  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
