Rails.application.routes.draw do
  mount_griddler('/api/v1/notifications/parse')
end
