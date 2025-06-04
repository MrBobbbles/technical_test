require "application_system_test_case"

class UserFlowsTest < ApplicationSystemTestCase
  test "user can sign up and log in" do
    sign_up_with(email: "tester1@test.com", password:"password1")
    assert_text "My Galleries"
    log_out()
    assert_no_text "My Galleries"
    log_in_with(email: "tester1@test.com", password: "password1")
    assert_text "My dsadad", "log in didn't work"
  end
end