require "test_helper"
include ActionDispatch::TestProcess

class PhotoTest < ActiveSupport::TestCase
  test "should not save photo without name" do
    photo = Photo.new(gallery: galleries(:one))
    assert_not photo.save, "Saved the photo without a name"
  end

  test "should not save photo without gallery" do
    photo = Photo.new(name: "Test Photo")
    assert_not photo.save, "Saved the photo without a gallery"
  end
end
