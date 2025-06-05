require "test_helper"

class GalleryTest < ActiveSupport::TestCase
  test "should not save gallery without name" do
    user = users(:one) # from fixtures
    gallery = Gallery.new(description: "Test description", user: user)
    assert_not gallery.save, "Saved the gallery without a name"
  end

  test "should save valid gallery" do
    user = users(:one) # from fixtures
    gallery = Gallery.new(name: "Test Name", description: "Test description", user: user)
    assert gallery.save
  end

  test "should save gallery without description" do
    user = users(:one)
    gallery = Gallery.new(name: "Test name", user: user)
    assert gallery.save, "Did not save the gallery without a description"
  end

  test "should destroy associated photos" do
    gallery = galleries(:one)
    assert_difference("Photo.count", -gallery.photos.count) do
      gallery.destroy
    end
  end
end
