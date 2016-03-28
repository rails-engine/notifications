Rails.application.routes.draw do
  devise_for :users
  mount Notifications::Engine => "/homeland"
  root to: 'welcome#index'
end
