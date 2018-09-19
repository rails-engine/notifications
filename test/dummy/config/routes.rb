Rails.application.routes.draw do
  resources :comments
  resources :topics
  devise_for :users
  mount Notifications::Engine => '/notifications'
  root to: 'welcome#index'
end
