Rails.application.routes.draw do
  post "/parse", action: :parse, controller: NotificationsController
end
