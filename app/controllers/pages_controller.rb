class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @questions = orders(if params[:search].nil?
                          Question.all
                        else
                          Question.search(params[:search]).records
                 end).page(params[:page]).per(10)
    @posts = orders(if params[:search].nil?
                      Post.all
                    else
                      Post.search(params[:search]).records
             end).page(params[:page]).per(10)
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
