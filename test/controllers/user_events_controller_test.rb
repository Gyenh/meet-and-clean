require 'test_helper'

class UserEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_event = user_events(:one)
  end

  test "should get index" do
    get user_events_url
    assert_response :success
  end

  test "should get new" do
    get new_user_event_url
    assert_response :success
  end

  test "should create user_event" do
    assert_difference('UserEvent.count') do
      post user_events_url, params: { user_event: { event_id: @user_event.event_id, user_id: @user_event.user_id } }
    end

    assert_redirected_to user_event_url(UserEvent.last)
  end

  test "should show user_event" do
    get user_event_url(@user_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_event_url(@user_event)
    assert_response :success
  end

  test "should update user_event" do
    patch user_event_url(@user_event), params: { user_event: { event_id: @user_event.event_id, user_id: @user_event.user_id } }
    assert_redirected_to user_event_url(@user_event)
  end

  test "should destroy user_event" do
    assert_difference('UserEvent.count', -1) do
      delete user_event_url(@user_event)
    end

    assert_redirected_to user_events_url
  end
end
