class CategoriesController < ApplicationController

  def index
    @categories = if params[:search].nil?
                     Category.all.order(:name)
                   else
                     Category.search(params[:search]).records
                  end
  end

  def show
    @category = Category.find_by_name(params[:id])
    @posts = @category.tags.where(object_type: 'Post').map { |post| Post.find(post.object_id) }
    @questions = @category.tags.where(object_type: 'Question').map { |question| Question.find(question.object_id) }
    if @posts.count + @questions.count == 1
      redirect_to post_path(@posts.first.id) if @posts.count == 1
      redirect_to question_path(@questions.first.id) if @questions.count == 1
    end
  end

  private

  def title
    @title = 'Категорії'
  end
end
