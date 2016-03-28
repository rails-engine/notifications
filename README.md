# Notifications

Rails mountable Notification for any applications.

[![Gem Version](https://badge.fury.io/rb/notifications.svg)](https://badge.fury.io/rb/notifications) [![Build Status](https://travis-ci.org/rails-engine/notifications.svg)](https://travis-ci.org/rails-engine/notifications) [![Code Climate](https://codeclimate.com/github/rails-engine/notifications/badges/gpa.svg)](https://codeclimate.com/github/rails-engine/notifications) [![codecov.io](https://codecov.io/github/rails-engine/notifications/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/notifications?branch=master) [![](http://inch-ci.org/github/rails-engine/notifications.svg?branch=master)](http://inch-ci.org/github/rails-engine/notifications?branch=master)

## Installation

```ruby
# Gemfile
gem 'notifications'
```

And then run `bundle install`.

Now you have notifications generator in Rails application:

```bash
$ rails g notifications:install
```

And, you can generate views, controller if you need custom them:

```bash
$ rails g notifications:views
$ rails g notifications:controllers
```

## Usage

### Create a Notification

```ruby
class User
  def follow(user)
    Notification.create(notify_type: 'follow', actor: self, user: user)
  end
end

class Comment
  belongs_to :post
  belongs_user :user

  after_commit :create_notifications, on: [:create]
  def create_notifications
    Notification.create(
      notify_type: 'comment',
      actor: self.user,
      user: self.post.user,
      target: self)
  end
end
```

### Write your custom Notification partial view for notify_types:

TODO...

### Mark notifications as read

You can set multiple Notification as read by:

```ruby
notification_ids = [1, 2 ...]
Notification.read!(current_user.id, notification_ids)
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
