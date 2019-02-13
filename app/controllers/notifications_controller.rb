class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.notifications
  end

  def read
    @notification = Notification.find(params[:id])
    if current_user.id == @notification.user.id && !@notification.read_at
      @notification.update(read_at: Time.now)
    end
    redirect_back(fallback_location: root_path)
  end

  def unread
    @notification = Notification.find(params[:id])
    if current_user.id == @notification.user.id && @notification.read_at
      @notification.update(read_at: nil)
    end
    redirect_back(fallback_location: root_path)
  end
end
