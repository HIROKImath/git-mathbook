require 'test_helper'

class BookImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get book_images_new_url
    assert_response :success
  end

  test "should get edit" do
    get book_images_edit_url
    assert_response :success
  end

  test "should get update" do
    get book_images_update_url
    assert_response :success
  end

  test "should get destroy" do
    get book_images_destroy_url
    assert_response :success
  end

end
