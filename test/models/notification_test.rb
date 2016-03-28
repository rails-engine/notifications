require 'test_helper'

class NotificationTest < ActiveSupport::TestCase
  test '.read?' do
    note = create(:notification)
    assert_equal false, note.read?

    note.update_attribute(:read_at, Time.now)
    assert_equal true, note.read?
  end
end
