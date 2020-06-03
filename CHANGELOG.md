1.0.0
-----

- Require Rails >= 5.2.
- Fix primary key for use `bigint` column type.

0.6.1
-----

- Dependency Rails >= 5;

0.6.0
-----

- Dependency Rails ~> 5;

-----------

0.5.0
-----

- Dependency Rails ~> 4.2;

----------------------

0.4.4
-----

- Fix for supports Rails 5.2;

0.4.3
-----

- Change `belongs_to :target` with optional for comply with Rails 5 (#9)

0.4.2
-----

- Fix migration warning in Rails 5.1

0.4.1
-----

- Gem dependency for Rails 5.x.

0.4.0
-----

Break Changes:

- Use Kaminari instead of will_paginate.
- Remove `config.per_page` config.

0.3.0
-----

Break changes:

- `config.user_profile_url_method` now default is nil;
- `config.authenticate_user_method` now default is nil;
- It's will not disaply avatar, when you don't setup `user.profile_url` and `user.avatar_url`;

Bug fix:

- Bugfix with that "undefined method `notifications' for <User>".

0.2.0
-----

- Group notification by days.

0.1.0
-----

- Add mount Engine into routes.rb when run install command.
- Fix migration install command bug in Rails 4.x;

0.0.5
-----

- Display no records message in notification list.
- Remove bad admin?, owner? method in notifications_controller.

0.0.4
-----

- Add pagination.
- Add fragment cache for notification view.
- Add notify_type into notification row class name.

0.0.3
-----

- Fix `rails g notifications:views` bug, and add default stylesheet.
- Fix `rails g notifications:controllers` bug.
- Add zh-CN I18n file, fix i18n generator.

0.0.2
-----

- First release.
