require "application_system_test_case"

class UserEventsTest < ApplicationSystemTestCase
  setup do
    @user_event = user_events(:one)
  end

  test "visiting the index" do
    visit user_events_url
    assert_selector "h1", text: "User Events"
  end

  test "creating a User event" do
    visit user_events_url
    click_on "New User Event"

    fill_in "Event", with: @user_event.event_id
    fill_in "User", with: @user_event.user_id
    click_on "Create User event"

    assert_text "User event was successfully created"
    click_on "Back"
  end

  test "updating a User event" do
    visit user_events_url
    click_on "Edit", match: :first

    fill_in "Event", with: @user_event.event_id
    fill_in "User", with: @user_event.user_id
    click_on "Update User event"

    assert_text "User event was successfully updated"
    click_on "Back"
  end

  test "destroying a User event" do
    visit user_events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User event was successfully destroyed"
  end
end
