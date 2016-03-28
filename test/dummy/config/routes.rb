Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
end
