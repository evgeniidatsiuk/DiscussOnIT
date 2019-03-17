require 'elasticsearch/model'
class Category < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  has_many :tags, dependent: :destroy
  validates :name, presence: true

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :name, analyzer: 'english'
    end
  end

  def self.search(query)
    __elasticsearch__.search(
        query: {
            multi_match: {
                query: query,
                fields: %w[name]
            }
        },
        highlight: {
            pre_tags: ['<em>'],
            post_tags: ['</em>'],
            fields: {
                name: {}
            }
        }
    )

  end
end

Category.import force: true
