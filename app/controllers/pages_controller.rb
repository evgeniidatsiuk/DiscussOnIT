class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts      ||= orders(Post.all).page(params[:page]).per(10)
    @questions  ||= orders(Question.all).page(params[:page]).per(10)
  end

  def searcha
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

  def order
    order_name = params[:name]
    session['order_type'] = if session['order_name'] == order_name && session['order_type'] != 'ASC'
                              'ASC'
                            else
                              'DESC'
                            end
    session['order_name'] = order_name if %w[name score created_at view].include?(order_name)
    redirect_back(fallback_location: root_path)
  end
end
