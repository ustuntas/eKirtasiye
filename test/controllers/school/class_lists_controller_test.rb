require "test_helper"

class School::ClassListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get school_class_lists_index_url
    assert_response :success
  end

  test "should get show" do
    get school_class_lists_show_url
    assert_response :success
  end

  test "should get new" do
    get school_class_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get school_class_lists_create_url
    assert_response :success
  end

  test "should get edit" do
    get school_class_lists_edit_url
    assert_response :success
  end

  test "should get update" do
    get school_class_lists_update_url
    assert_response :success
  end

  test "should get destroy" do
    get school_class_lists_destroy_url
    assert_response :success
  end

  test "should get publish" do
    get school_class_lists_publish_url
    assert_response :success
  end

  test "should get unpublish" do
    get school_class_lists_unpublish_url
    assert_response :success
  end

  test "should get versions" do
    get school_class_lists_versions_url
    assert_response :success
  end
end
