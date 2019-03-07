class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  # respond_to :html, :js

  def orders(dates)
    return dates.order("#{session['order_name']} #{session['order_type']}") unless session['order_name'].nil?

    dates
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[login password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[nickname email password password_confirmation current_password])
  end
end
