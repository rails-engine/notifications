require 'rails/generators'
module Notifications
  module Generators
    class ViewsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path('../../..', __dir__)
      desc "Used to copy Notifications's views to your application's views."

      def copy_views
        directory 'app/views/notifications', 'app/views/notifications'
        template 'app/assets/stylesheets/notifications.scss', 'app/assets/stylesheets/notifications.scss'
      end
    end
  end
end
