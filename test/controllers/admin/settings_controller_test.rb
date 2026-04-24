require "test_helper"

class Admin::SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_settings_url
    assert_response :success
  end

  test "should get update" do
    patch admin_settings_url, params: { setting: { } }
    assert_response :success
  end
end
