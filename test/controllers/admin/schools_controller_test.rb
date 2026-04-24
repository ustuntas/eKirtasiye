require "test_helper"

class Admin::SchoolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = School.create!(
      name: "Test Okul #{SecureRandom.hex(3)}",
      email: "school-#{SecureRandom.hex(3)}@example.com",
      tax_number: "#{rand(10**9..10**10-1)}",
      phone: "05000000000",
      status: :pending,
      address: "Adres"
    )
  end

  test "renders schools management dashboard" do
    get admin_schools_url
    assert_response :success
    assert_select "h1", text: /Okulları Yönet/i
    assert_select "h2", text: /Okul Listesi/i
  end

  test "renders edit form" do
    get edit_admin_school_url(@school)
    assert_response :success
    assert_select "h1", text: /Okul Düzenle/i
  end

  test "approves school" do
    post approve_admin_school_url(@school)
    assert_redirected_to admin_school_url(@school)
    assert_equal "approved", @school.reload.status
  end
end
