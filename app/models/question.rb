class Question < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :right_answer, class_name: 'Answer', dependent: :destroy
  has_many :votes, as: :object, dependent: :destroy
<<<<<<< HEAD
  has_many :chosens, as: :object, dependent: :destroy
  include ChosenModul

=======
>>>>>>> 724e27f179755486a36959406f77a6613d043c94
  def url
    ['', self.class.name.downcase + 's', id.to_s].join('/')
  end

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
