module Notifications
  class ApplicationController < ::ApplicationController
    helper_method :current_user

    alias_method :origin_current_user, Notifications.config.current_user_method.to_sym
    if Notifications.config.authenticate_user_method
      alias_method :origin_authenticate_user!, Notifications.config.authenticate_user_method.to_sym
    end

    before_action :authenticate_user!

    def current_user
      origin_current_user
    end

    def authenticate_user!
      origin_authenticate_user! if Notifications.config.authenticate_user_method
    end
  end
end
