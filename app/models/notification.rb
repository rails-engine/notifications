# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model

  self.per_page = 20

  # Write your custom methods...
end
