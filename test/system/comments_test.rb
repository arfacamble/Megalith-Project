require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  testuser = User.create(email: 'test@user.com', username: 'Test User', password: 'password')

  test "User can add a new comment" do
    initial_comment_count = Comment.count
    log_in
    visit megalith_path(Megalith.first)
    # save_and_open_screenshot

    fill_in 'comment_text', with: "This stone is really memorable. It has smooth bits and rough bits like a typical stone. It sits on the ground and emerges somewhat from it, having a three-dimensional kind of style."
    click_on 'Create Comment'
    assert Comment.count == initial_comment_count + 1
  end

  private

  def log_in
    visit new_user_session_path
    fill_in "user[email]", with: "test@user.com"
    fill_in "user[password]", with: "password"
    click_on "Log in"
  end
end
