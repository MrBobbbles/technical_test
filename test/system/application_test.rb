require "application_system_test_case"
require "test_helper"

class UserFlowsTest < ApplicationSystemTestCase
  test "user can sign up and be logged in" do
    sign_up_with(email: "tester1@test.com", password: "password1")
    assert_text "My Galleries"
  end

  test "user can sign up and sign out" do
    sign_up_with(email: "tester1@test.com", password: "password1")
    log_out()
    assert_no_text "My Galleries"
  end

  test "user can sign up and log in" do
    sign_up_with(email: "tester1@test.com", password: "password1")
    log_out()
    log_in_with(email: "tester1@test.com", password: "password1")
    assert_text "My Galleries"
  end

  test "make public gallery" do
    sign_up_with(email: "tester1@test.com", password: "password1")
    view_galleries()
    add_gallery_with(name: "test gallery1", description: "test description")
    assert_text "test gallery1"
    log_out()
    assert_text "test gallery1"
  end

  test "adding photo" do
    sign_up_with(email: "tester1@test.com", password: "password1")
    view_galleries()
    add_gallery_with(name: "test gallery1", description: "test description")
    add_photo_with(name: "test photo1")
    assert_text "test photo1"
  end

  test "clicking thumbnail" do
    sign_up_with(email: "tester1@test.com", password: "password1")
    view_galleries()
    add_gallery_with(name: "test gallery1", description: "test description")
    add_photo_with(name: "test photo1")
    find("img[alt='test photo1']").click
    assert_text "Back to Gallery"
  end
end
