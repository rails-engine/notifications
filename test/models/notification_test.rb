require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test '.read?' do
    note = create(:notification)
    assert_equal false, note.read?

    note.update_attribute(:read_at, Time.now)
    assert_equal true, note.read?
  end

  test '#read!' do
    notes = create_list(:notification, 3)
    t = Time.now
    Time.stub(:now, t) do
      Notification.read!(notes.collect(&:id))
    end
    notes.each do |note|
      assert_equal false, note.read?
      note.reload
      assert_equal t.to_i, note.read_at.to_i
      assert_equal true, note.read?
    end
  end

  test '.actor_name' do
    note = create(:notification)
    assert_equal note.actor.name, note.actor_name

    note = create(:notification, actor: nil)
    assert_equal '', note.actor_name
  end

  test '.actor_avatar_url' do
    note = create(:notification, actor: nil)
    assert_equal Notification::DEFAULT_AVATAR, note.actor_avatar_url

    note = create(:notification)
    assert_equal Notification::DEFAULT_AVATAR, note.actor_avatar_url

    user = create(:user)
    user.stub(:avatar_url, '123') do
      Notifications.config.stub(:user_avatar_url_method, :avatar_url) do
        note.stub(:actor, user) do
          assert_equal '123', note.actor_avatar_url
        end
      end
    end
  end

  test '.actor_profile_url' do
    note = create(:notification, actor: nil)
    assert_equal '#', note.actor_profile_url

    note = create(:notification)
    assert_equal "/users/#{note.actor_id}", note.actor_profile_url
  end

  test '#unread_count' do
    user = create(:user)
    create(:notification)
    create_list(:notification, 2, user: user, read_at: Time.now)
    create_list(:notification, 3, user: user)
    assert_equal 3, Notification.unread_count(user)
  end
end
