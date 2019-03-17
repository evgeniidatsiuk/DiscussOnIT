class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.notifications
  end

  def read
    notification.update(read_at: Time.now) if notification && !notification.read_at
    redirect_back(fallback_location: root_path)
  end

  def unread
    notification.update(read_at: nil) if notification && notification.read_at
    redirect_back(fallback_location: root_path)
  end

  private

  def notification
    @notification ||= current_user.notifications.find_by(id: params[:id])
  end
end
