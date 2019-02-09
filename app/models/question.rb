class Question < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :right_answer, class_name: 'Answer', dependent: :destroy
  has_many :votes, as: :object, dependent: :destroy
  has_many :chosens, as: :object, dependent: :destroy
  validates :name, length: { maximum: 50, message: "Something is wrong. Максимум 50 символів, бо ми лиш вчимо front-end, ok da " }
  # validates :name,:text, presence: true
   validates :name, presence: { message: "Something is wrong. Майже, введіть ще раз дані" }
   validates :text, presence: { message: "Something is wrong. Майже, введіть ще раз дані" }
  include ChosenModul

  def url
    ['', self.class.name.downcase + 's', id.to_s].join('/')
  end

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end
end
