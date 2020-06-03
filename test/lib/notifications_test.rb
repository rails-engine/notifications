require "test_helper"

class NotificationsTest < ActiveSupport::TestCase
  test ".config" do
    assert_kind_of Notifications::Configuration, Notifications.config
    assert_equal "User", Notifications.config.user_class
    assert_equal "current_user", Notifications.config.current_user_method
    assert_equal "authenticate_user!", Notifications.config.authenticate_user_method
    assert_nil Notifications.config.user_profile_url_method
    assert_nil Notifications.config.user_avatar_url_method
    assert_equal "name", Notifications.config.user_name_method
  end
end
