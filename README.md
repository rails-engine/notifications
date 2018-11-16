# Notifications

Mountable notifications for any Rails applications.

[![Gem Version](https://badge.fury.io/rb/notifications.svg)](https://badge.fury.io/rb/notifications) [![Build Status](https://travis-ci.org/rails-engine/notifications.svg)](https://travis-ci.org/rails-engine/notifications) [![codecov.io](https://codecov.io/github/rails-engine/notifications/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/notifications?branch=master)

## Example:

<img width="800" alt="2016-03-29 10 48 16" src="https://cloud.githubusercontent.com/assets/5518/16578955/eb59e472-42cf-11e6-825e-8fc9ecf58a8b.png">

## Installation

```ruby
# Gemfile Rails ~> 5
gem 'notifications', '~> 0.6.0'
# Gemfile for Rails ~> 4.2
gem 'notifications', '~> 0.5.0'
```

And then run `bundle install`.

You now have a notifications generator in your Rails application:

```bash
$ rails g notifications:install
```

You can generate views, controllers if you need to customize them:

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
  belongs_to :user

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

Get unread notifications count for a user:

```rb
count = Notification.unread_count(current_user)
```

### Write your custom Notification partial view for notify_types:

If you create a notify_type, you need to add a partial view in `app/views/notifications/` path, for example:

```rb
# There have two notify_type
Notification.create(notify_type: 'follow' ....)
Notification.create(notify_type: 'mention', target: @reply, second_target: @topic, ....)
```

Your app must have:

- app/views/notifications/_follow.html.erb
- app/views/notifications/_mention.html.erb

```erb
# app/views/notifications/_follow.html.erb
<div class="media-heading">
  <%= link_to notification.actor.title, main_app.user_path(notification.actor) %> just followed you.
</div>
```

```erb
# app/views/notifications/_mention.html.erb
<div class="media-heading">
  <%= link_to notification.actor.title, main_app.user_path(notification.actor) %> has mentioned you in
  <%= link_to notification.second_target.title, main_app.topic_path(notification.second_target) %>
</div>
<div class="media-content">
  <%= notification.target.body %>
</div>
```

> NOTE: When you want use Rails route path name in notification views, you must use [main_app](http://api.rubyonrails.org/classes/Rails/Engine.html#class-Rails::Engine-label-Using+Engine-27s+routes+outside+Engine) prefix. etc: `main_app.user_path(user)`

### About Notification template N+1 performance

It is recommended that you use [second_level_cache](https://github.com/hooopo/second_level_cache) for solving N+1 performance issues.

## Contributing

Testing for multiple Rails versions:

```bash
make test_51
# or test all
make test
```

## Site Used

- [Ruby China](https://ruby-china.org)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
