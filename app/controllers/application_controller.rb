class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :userparam_create

  def orders(dates)
    return dates.order("#{session['order_name']} #{session['order_type']}") unless session['order_name'].nil?

    dates
  end

  private

  def userparam_create
    if user_signed_in?
      redirect_to new_userparam_path unless current_user.userparam
    end
  end
end
