class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @posts = []
      @questions = []
    else
      @posts = Post.search params[:q]
      @questions = Question.search params[:q]
    end
  end
end
