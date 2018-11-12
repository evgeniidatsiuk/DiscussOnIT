class Post < ApplicationRecord
    extend OrderAsSpecified
    
	before_destroy :post_destroy

	belongs_to :user

	has_many :postcomments, dependent: :destroy

	validates :title, :body, presence: true
    validates :title, length: 5..64
    validates :body, length: 8..256

	def all_tags
    	Tag.where(resource_type: self.class.name, resource_id: self.id).map{|tag| tag = Category.find(tag.category_id)}.map(&:name).join(', ')
    end

    private

    def post_destroy
    	Vote.where(resource_type: self.class.name, resource_id: self.id).each do |vote|
            vote.destroy()
        end
        Tag.where(resource_type: "Post",resource_id:self.id).each do |tag|
            tag.destroy()
        end
    end
end
