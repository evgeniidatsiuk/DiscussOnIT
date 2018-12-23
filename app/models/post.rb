class Post < ApplicationRecord
  belongs_to :user
  has_many :сomments, as: :object
  has_many :tags, as: :object
  has_many :votes, as: :object
  has_many :chosens, as: :object, dependent: :destroy
  include ChosenModul

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
