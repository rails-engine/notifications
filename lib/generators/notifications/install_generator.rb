require 'rails/generators'
module Notifications
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Create Notifications's base files"
      source_root File.expand_path("../../../../", __FILE__)

      def add_initializer
        path = "#{Rails.root}/config/initializers/notifications.rb"
        if File.exists?(path)
          puts "Skipping config/initializers/notifications.rb creation, as file already exists!"
        else
          puts "Adding Homeland initializer (config/initializers/notifications.rb)..."
          template "config/initializers/notifications.rb", path
        end
      end

      def add_models
        path = "#{Rails.root}/app/models/notification.rb"
        if File.exists?(path)
          puts "Skipping notification.rb creation, as file already exists!"
        else
          puts "Adding model (notification.rb)..."
          template "app/models/notification.rb", path
        end
      end

      def add_routes
        route 'mount Notifications::Engine => "/notifications"'
      end

      def add_migrations
        `rake notifications:install:migrations`
      end
    end
  end
end
