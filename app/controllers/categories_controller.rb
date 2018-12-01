class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:name)
  end

  def show
    @category = Category.find_by_name(params[:id])
    @posts = @category.tags.where(object_type: 'Post').map { |post| Post.find(post.object_id) }
    @questions = @category.tags.where(object_type: 'Question').map { |question| Question.find(question.object_id) }
  end
end
