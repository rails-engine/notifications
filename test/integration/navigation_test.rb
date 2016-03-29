require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = create(:user)
  end

  test 'GET / without login' do
    get notifications_path
    assert_required_user
  end

  test 'GET / with login' do
    sign_in @current_user
    create_list(:notification, 2)
    comment = create(:comment)
    notes = create_list(:notification, 3, target: comment,
                                          second_target: comment.topic,
                                          notify_type: 'comment',
                                          user: @current_user)
    get '/notifications'
    assert_response :success
    assert_select '.notifications' do
      assert_select '.notification', 4
      assert_select '.notification-new_topic', 1
      assert_select '.notification-comment', 3
      assert_select '.unread', 4
    end

    notes.each do |note|
      note.reload
      assert_equal true, note.read?
    end

    get '/notifications'
    assert_response :success
    assert_select '.notifications' do
      assert_select '.notification', 4
      assert_select '.unread', 0
    end
  end

  test 'DELETE /clean without login' do
    delete '/notifications/clean'
    assert_required_user
  end

  test 'DELETE /clean with login' do
    sign_in @current_user
    create_list(:notification, 2)
    notes = create_list(:notification, 3, user: @current_user)
    assert_difference "Notification.count", -3 do
      delete '/notifications/clean'
      assert_response :redirect
    end

    delete '/notifications/clean'
    assert_response :redirect
  end
end

