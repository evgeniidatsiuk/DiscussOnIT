class PagesController < ApplicationController
  def index
    @questions = @q.result(distinct: true)
    @posts= Post.ransack(params[:q]).result(distinct: true)
  end
end
