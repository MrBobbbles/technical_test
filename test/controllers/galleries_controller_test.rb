require "test_helper"

class GalleriesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @gallery = galleries(:one)  # assuming you have fixture data
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get galleries_url
    assert_response :success
  end

  test "should get show" do
    get gallery_url(@gallery)
    assert_response :success
  end

  test "should get new" do
    get new_gallery_url
    assert_response :success
  end

  test "should create gallery" do
    assert_difference('Gallery.count') do
      post galleries_url, params: { gallery: { name: "Test Gallery", description: "Test description" } }
    end
    assert_redirected_to gallery_url(Gallery.last)
  end

  test "should get edit" do
    get edit_gallery_url(@gallery)
    assert_response :success
  end

  test "should update gallery" do
    patch gallery_url(@gallery), params: { gallery: { name: "Updated Name" } }
    assert_redirected_to gallery_url(@gallery)
    @gallery.reload
    assert_equal "Updated Name", @gallery.name
  end

  test "should destroy gallery" do
    assert_difference('Gallery.count', -1) do
      delete gallery_url(@gallery)
    end
    assert_redirected_to user_galleries_url
  end
end
