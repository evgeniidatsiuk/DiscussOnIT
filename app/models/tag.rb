class Tag < ApplicationRecord
  belongs_to :object, polymorphic: true
  belongs_to :category

  def all_tags_c(object, names)
    pp object
    names = names.split(",").map { |name| name = name.strip.downcase }
    names.delete("")
    if names
      names.to_set.map do |name|
        category = Category.where(name: name).first_or_create!
        tag = Tag.where(category_id: category.id, object_type: object.class.name,object_id: object.id).first_or_create!
      end
    end
    object.tags.map do |tag|
      tag.destroy unless names.include?(Category.find(tag.category_id).name)
    end
  end
end
