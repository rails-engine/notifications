require "test_helper"

class NavigationTest < ActionDispatch::IntegrationTest
  setup do
    @current_user = create(:user)
  end

  test "GET / without login" do
    Notifications.config.stub(:authenticate_user_method, :authenticate_user!) do
      get notifications_path
    end
    assert_required_user
  end

  test "GET / with login" do
    sign_in @current_user
    without_notes = create_list(:notification, 2)
    create_list(:notification, 3, target_type: "Comment",
                                  target_id: 10,
                                  second_target_type: "Topic",
                                  second_target_id: 100,
                                  notify_type: "comment",
                                  user: @current_user)
    create_list(:notification, 2, target_type: "Topic",
                                  target_id: 101,
                                  notify_type: "new_topic",
                                  created_at: 1.days.ago,
                                  user: @current_user)
    get "/notifications"
    assert_response :success
    assert_select ".notifications" do
      assert_select "#notification-#{without_notes[0].id}", 0
      assert_select "#notification-#{without_notes[1].id}", 0
    end

    assert_select ".notifications" do
      assert_select ".notification", 5
      assert_select ".notification-group", 2
      assert_select ".notification-new_topic", 2
      assert_select ".notification-comment", 3
      assert_select ".unread", 5
    end

    get "/notifications"
    assert_response :success
    assert_select ".notifications" do
      assert_select ".notification", 5
      assert_select ".notification-group", 2
      assert_select ".unread", 0
    end
  end

  test "POST /read" do
    sign_in @current_user
    notes = create_list(:notification, 3, user: @current_user)
    post "/notifications/read", params: { ids: notes.collect(&:id) }
    assert_response :success
    notes.each do |note|
      assert_equal true, note.reload.read?
    end
  end

  test "DELETE /clean without login" do
    delete "/notifications/clean"
    assert_required_user
  end

  test "DELETE /clean with login" do
    sign_in @current_user
    create_list(:notification, 2)
    create_list(:notification, 3, user: @current_user)
    assert_difference "Notification.count", -3 do
      delete "/notifications/clean"
      assert_response :redirect
    end

    delete "/notifications/clean"
    assert_response :redirect
  end
end
