# coding: utf-8
require 'rails/generators'
module Notifications
  module Generators
    class ViewsGenerator < Rails::Generators::Base #:nodoc:
      source_root File.expand_path("../../../../app/views", __FILE__)
      desc "Used to copy Notifications's views to your application's views."

      def copy_views
        directory 'homeland', "app/views/notifications"
        directory 'layouts/notifications', "app/views/layouts/notifications"
      end
    end
  end
end
