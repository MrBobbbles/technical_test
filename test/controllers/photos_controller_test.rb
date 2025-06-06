require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @gallery = galleries(:one)     # assumes you have fixtures for galleries
    @photo = photos(:one)           # assumes you have fixtures for photos
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get gallery_photos_url(@gallery)
    assert_response :success
  end

  test "should get show" do
    get gallery_photo_url(@gallery, @photo)
    assert_response :success
  end

  test "should get new" do
    get new_gallery_photo_url(@gallery)
    assert_response :success
  end

  test "should create photo" do
    assert_difference("Photo.count") do
      post gallery_photos_url(@gallery), params: { photo: { name: "New Photo", image: fixture_file_upload("test/fixtures/files/test.jpg", "image/jpeg") } }
    end
    assert_redirected_to gallery_url(@gallery)
  end

  test "should get edit" do
    get edit_gallery_photo_url(@gallery, @photo)
    assert_response :success
  end

  test "should update photo" do
    patch gallery_photo_url(@gallery, @photo), params: { photo: { name: "Updated Name", image: fixture_file_upload("test/fixtures/files/test.jpg", "image/jpeg") } }
    assert_redirected_to gallery_url(@gallery)
    @photo.reload
    assert_equal "Updated Name", @photo.name
  end

  test "should destroy photo" do
    assert_difference("Photo.count", -1) do
      delete gallery_photo_url(@gallery, @photo)
    end
    assert_redirected_to gallery_url(@gallery)
  end
end
