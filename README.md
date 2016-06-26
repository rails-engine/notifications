# Notifications

Rails mountable Notification for any applications.

[![Gem Version](https://badge.fury.io/rb/notifications.svg)](https://badge.fury.io/rb/notifications) [![Build Status](https://travis-ci.org/rails-engine/notifications.svg)](https://travis-ci.org/rails-engine/notifications) [![Code Climate](https://codeclimate.com/github/rails-engine/notifications/badges/gpa.svg)](https://codeclimate.com/github/rails-engine/notifications) [![codecov.io](https://codecov.io/github/rails-engine/notifications/coverage.svg?branch=master)](https://codecov.io/github/rails-engine/notifications?branch=master) [![](http://inch-ci.org/github/rails-engine/notifications.svg?branch=master)](http://inch-ci.org/github/rails-engine/notifications?branch=master)

## Example:

<img width="800" alt="2016-03-29 10 48 16" src="https://cloud.githubusercontent.com/assets/5518/16375560/8e17f516-3c8e-11e6-98d6-7d6e55c99938.png">

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

Get user unread count:

```rb
count = Notification.unread_count(current_user)
```

### Write your custom Notification partial view for notify_types:

If you create a notify_type, you need add a partial view in `app/views/notifications/` path, for example:

```rb
# There have two notify_type
Notification.create(notify_type: 'follow' ....)
Notification.create(notify_type: 'mention', target: @reply, second_target: @topic, ....)
```

You app must be have:

- app/views/notifications/_follow.html.erb
- app/views/notifications/_mention.html.erb

```erb
# app/views/notifications/_follow.html.erb
<div class="media-heading">
  <%= link_to notification.actor.title, notification.actor %> just followed you.
</div>
```

```erb
# app/views/notifications/_mention.html.erb
<div class="media-heading">
  <%= link_to notification.actor.title, notification.actor %> has mention you in
  <%= link_to notification.second_target.title, topic_path(notification.second_target) %>
</div>
<div class="media-content">
  <%= notification.target.body %>
</div>
```

### About Notification template N+1 performance

We suggest use [second_level_cached](https://github.com/hooopo/second_level_cache) for solve N+1 performance issue.

## Contributing

Contribution directions go here.

## Site Used

- [Ruby China](https://ruby-china.org)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
