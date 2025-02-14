require 'application_system_test_case'

class TripsTest < ApplicationSystemTestCase
  testuser = User.create(email: 'test@user.com', username: 'Test User', password: 'password')

  test "user can create a valid trip" do
    log_in
    trip_count = Trip.count

    visit megalith_path(Megalith.first)
    find_button('Plan a trip').click
    # save_and_open_screenshot

    fill_in "trip_name", with: "A good walk"
    fill_in "trip_tagline", with: "Around and about"
    # save_and_open_screenshot
    click_on "Create Trip"

    # save_and_open_screenshot
    assert_equal edit_trip_path(Trip.last), page.current_path
    assert_equal Trip.count, trip_count + 1
    assert_text "Describe and plan your walk with your fellow enthusiasts!"
  end

  test "user cannot create an invalid trip" do
    log_in
    trip_count = Trip.count

    visit megalith_path(Megalith.first)
    find_button('Plan a trip').click
    # save_and_open_screenshot

    # save_and_open_screenshot
    click_on "Create Trip"

    # save_and_open_screenshot
    assert_equal Trip.count, trip_count
    # in next line, why is it at POST method rather than
    # new_megalith_trip_path(Megalith.first) which is what shows in the screenshot above?
    assert_equal megalith_trips_path(Megalith.first), page.current_path
  end

  private

  def log_in
    visit new_user_session_path
    fill_in "user[email]", with: "test@user.com"
    fill_in "user[password]", with: "password"
    click_on "Log in"
  end
end
