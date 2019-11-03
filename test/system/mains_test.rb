require "application_system_test_case"

class MainsTest < ApplicationSystemTestCase
  test "redirects to login page if not signed in" do
    visit "/"
    assert_selector "h1", text: "Welcome to the login counter"
    assert_equal new_user_session_path, page.current_path
  end

  test "shows correct name and sign in count for signed in user" do
    login_as users(:test_user1)
    visit "/"
    assert_selector "h1", text: "Hello Tom"
    assert_equal root_path, page.current_path
    assert_text "Number of logins: 6"
    logout(:test_user1)

    login_as users(:test_user2)
    visit "/"
    assert_selector "h1", text: "Hello Bob"
    assert_equal root_path, page.current_path
    assert_text "Number of logins: 1"
  end

  test "lets a new user sign up" do
    visit "/"
    click_on 'Sign up'
    assert_equal new_user_registration_path, page.current_path
    fill_in "Name", with: "Dave"
    fill_in "Email", with: "dave@email.com"
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_on 'Sign up'
    assert_equal root_path, page.current_path
  end

  test "does not allow a user to sign up without a name" do
    visit "/"
    click_on 'Sign up'
    assert_equal new_user_registration_path, page.current_path
    fill_in "Email", with: "bill@email.com"
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_on 'Sign up'
    assert_equal user_registration_path, page.current_path
  end

  test "does not allow a user to sign up without an email" do
    visit "/"
    click_on 'Sign up'
    assert_equal new_user_registration_path, page.current_path
    fill_in "Name", with: "Ted"
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_on 'Sign up'
    assert_equal user_registration_path, page.current_path
  end

  test "it allows a user to change their name" do
    visit "/"
    click_on 'Sign up'
    assert_equal new_user_registration_path, page.current_path
    fill_in "Name", with: "Dave"
    fill_in "Email", with: "dave@email.com"
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_on 'Sign up'
    assert_equal root_path, page.current_path

    visit "/"
    assert_selector "h1", text: "Hello Dave"
    click_on 'Edit my account'
    fill_in "Name", with: "Ted"
    fill_in "Current password", with: "111111"
    click_on 'Update'
    assert_selector "h1", text: "Hello Ted"
    assert_equal root_path, page.current_path
  end
end
