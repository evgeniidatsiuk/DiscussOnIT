class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy
  has_many :votes, as: :object, dependent: :destroy
  has_many :chosens, as: :object, dependent: :destroy
  validates :name, length: { maximum: 50 }
  validates :name,:text, presence: true
  include ChosenModul

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
