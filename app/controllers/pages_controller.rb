class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts      ||= Post.all.order(created_at: :DESC).page(params[:page]).per(10)
    @questions  ||= Question.all.order(created_at: :DESC).page(params[:page]).per(10)
  end

  def search
    if params.key?(:search)
      @s_word = params[:search][:text].downcase.split(' ').map(&:strip)
      @s_word.delete('')
      @s_word = @s_word.to_set

      @posts = []
      Post.all.each do |post|
        @posts << post.id if @s_word.intersect?(post.name.downcase.split(' ').map(&:strip).to_set)
      end
      @posts = Post.find(@posts)

      @questions = []
      Question.all.each do |question|
        @questions << question.id if @s_word.intersect?(question.name.downcase.split(' ').map(&:strip).to_set)
      end
      @questions = Question.find(@questions.to_a)
      render 'index'
    else
      redirect_to root_path
    end
  end
end
