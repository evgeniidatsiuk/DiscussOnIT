module NotificationHelper
  def title(notification)
    render('userparams/user', object: notification.object) + ' ' + notification.write + ' to ' + link_to(notification.root.name, notification.object.url)
  end

  def watch_read_stat(notification)
    if !notification.read_at
      link_to(read_notification_path(notification.id)) do
        raw '<i class="fa fa-eye" style="color:red"></i>'
      end
    else
      link_to(unread_notification_path(notification.id)) do
        raw '<i class="fa fa-eye-slash" style="color:red"></i>'
      end
    end
  end
end
