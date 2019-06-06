class PagesController < ApplicationController
  # before_action :authenticate_user!

  def index
    posts
    questions
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
