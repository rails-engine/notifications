require 'rails/generators'
module Notifications
  module Generators
    class ControllersGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path('../../../app/controllers', __dir__)
      desc "Used to copy Notifications's controllers to your application's controllers."

      def copy_controllers
        %w[notifications].each do |fname|
          path = "#{Rails.root}/app/controllers/notifications/#{fname}_controller.rb"
          if File.exist?(path)
            puts "Skipping notifications/#{fname}_controller.rb creation, as file already exists!"
          else
            puts "Adding controller (notifications/#{fname}_controller.rb)..."
            template "notifications/#{fname}_controller.rb", path
          end
        end
      end
    end
  end
end
