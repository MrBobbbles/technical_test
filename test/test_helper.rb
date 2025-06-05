ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    def sign_up_with(email:, password:)
      visit new_user_registration_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      fill_in "Password confirmation", with: password
      click_button "Sign up"
    end

    def log_in_with(email:, password:)
      visit new_user_session_path
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Log in"
    end

    def log_out
      click_button "Log out" if page.has_button?("Log out")
    end

    def view_galleries
      click_link "My Galleries" if page.has_link?("My Galleries")
    end

    def add_gallery_with(name:, description:)
      click_link "Create Gallery" if page.has_link?("Create Gallery")
      fill_in "Name", with: name
      fill_in "Description", with: description
      click_button "Create Gallery"
    end

    def add_photo_with(name:)
      click_link "Add a Photo" if page.has_link?("Add a Photo")
      fill_in "Photo Name", with: name
      attach_file("photo[image]", Rails.root.join("test/fixtures/files/test.jpg"))
      click_button "Add to Gallery"
    end
  end
end
