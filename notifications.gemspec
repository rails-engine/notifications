$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "notifications/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "notifications"
  s.version     = Notifications::VERSION
  s.authors     = ["Jason Lee"]
  s.email       = ["huacnlee@gmail.com"]
  s.homepage    = "https://github.com/rails-engine/notifications"
  s.summary     = "Rails mountable Notification for any applications."
  s.description = "Rails mountable Notification for any applications."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.2.0", "< 5.1"

  s.add_development_dependency "mysql2"
end
