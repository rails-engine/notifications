require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test '.read?' do
    note = create(:notification)
    assert_equal false, note.read?

    note.update_attribute(:read_at, Time.now)
    assert_equal true, note.read?
  end

  test '#read!' do
    user1 = create(:user)
    user2 = create(:user)
    notes1 = create_list(:notification, 2, user: user1)
    notes2 = create_list(:notification, 2, user: user2)
    t = Time.now
    Time.stub(:now, t) do
      Notification.read!(user1.id, notes1.collect(&:id) + notes2.collect(&:id))
    end
    notes1.each do |note|
      note.reload
      assert_equal t.to_i, note.read_at.to_i
      assert_equal true, note.read?
    end

    notes2.each do |note|
      note.reload
      assert_equal nil, note.read_at
    end
  end
end
