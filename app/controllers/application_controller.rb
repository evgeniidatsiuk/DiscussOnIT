class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :userparam_create

  def orders(dates)
    if session['order'].nil? || session['order'] == 'date'
      return dates.order(created_at: :DESC)
    else
      return dates.order(name: :DESC) if session['order'] == 'name'
      # return dates.order(rait: :DESC) if session['order'] == 'vote'
    end

    dates
  end

  private

  def userparam_create
    if user_signed_in?
      redirect_to new_userparam_path unless current_user.userparam
    end
  end
end
