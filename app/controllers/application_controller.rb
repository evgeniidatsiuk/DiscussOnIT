class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :title
  respond_to :html, :js

  def orders(dates)
    return dates.order("#{session['order_name']} #{session['order_type']}") unless session['order_name'].nil?

    dates
  end

  protected

  def title; end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname email password password_confirmation current_password])
  end

  def search
    @search ||= params[:search]
  end

  def questions
    @questions ||= orders(if search.nil?
                            Question.all
                          else
                            Question.search(search).records
                 end).page(params[:page]).per(10)
  end

  def posts
    @posts ||= orders(if search.nil?
                        Post.all
                      else
                        Post.search(search).records
             end).page(params[:page]).per(10)
  end
end
