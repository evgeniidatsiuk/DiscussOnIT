require 'elasticsearch/model'
# Основний елемент взаємодії з сайтом, дає змогу користувачам задавати питання і в подальшому надавати відповідь
class Question < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user

  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_one :right_answer, class_name: 'Answer', dependent: :destroy
  has_many :votes, as: :object, dependent: :destroy
  has_many :chosens, as: :object, dependent: :destroy
  validates :name, length: { maximum: 50, message: 'Something is wrong. Максимум 50 символів, бо ми лиш вчимо front-end, ok da ' }
  # validates :name,:text, presence: true
  validates :name, presence: { message: 'Something is wrong. Майже, введіть ще раз дані' }
  validates :text, presence: { message: 'Something is wrong. Майже, введіть ще раз дані' }
  include ChosenModul

  def url
    ['', self.class.name.downcase + 's', id.to_s].join('/')
  end

  def all_tags
    tags.map { |tag| Category.find(tag.category_id) }.map(&:name).join(', ')
  end

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
      indexes :text, analyzer: 'english'
    end
  end
  def self.search(query)
    __elasticsearch__.search(
      query: {
        multi_match: {
          query: query,
          fields: %w[name text]
        }
      },
      highlight: {
        pre_tags: ['<em>'],
        post_tags: ['</em>'],
        fields: {
          name: {},
          text: {}
        }
      }
    )
  end
end

# Index all article records from the DB to Elasticsearch
# Question.import force: true
