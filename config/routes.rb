Notifications::Engine.routes.draw do
  resources :notifications, path: '' do
    collection do
      delete :clean
    end
  end
end
