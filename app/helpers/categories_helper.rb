module CategoriesHelper
  def tags(object)
    raw object.tags.map { |tag|
      # pp tag
      link_to tag.category_name, category_path(tag.category_name), class: 'badge tag'
    }.join(' ')
  end
end
