module Notifications
  class Configuration
    # class name of you User model, default: 'User'
    attr_accessor :user_class

    # method of user name in User model, default: 'name'
    attr_accessor :user_name_method

    # method of user avatar in User model, default: nil
    #
    # We suggest you give image size more than 48x48 px.
    #
    # Example:
    #
    # class User
    #   def avatar_url
    #     self.avatar.url('48x48')
    #   end
    # end
    #
    # config.user_avatar_url_method = :avatar_url
    #
    attr_accessor :user_avatar_url_method

    # method name of user profile page path, in User model, default: nil
    # Example:
    #
    # class User
    #   def profile_url
    #     "http://www.host.com/u/#{self.username}"
    #   end
    # end
    #
    # config.user_profile_url_method = 'profile_url'
    attr_accessor :user_profile_url_method

    # current_user method name in your Controller, default: 'current_user'
    attr_accessor :current_user_method

    # authenticate_user method in your Controller, default: nil
    attr_accessor :authenticate_user_method
  end
end
