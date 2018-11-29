class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
    @questions = Question.all
   end
end
