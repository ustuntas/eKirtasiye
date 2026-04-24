require "test_helper"

class Admin::SchoolAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school = School.create!(
      name: "Account School #{SecureRandom.hex(3)}",
      email: "acc-school-#{SecureRandom.hex(3)}@example.com",
      tax_number: "#{rand(10**9..10**10-1)}",
      phone: "05000000001",
      status: :approved,
      address: "Adres"
    )
    @account_user = User.create!(
      email_address: "school-account-#{SecureRandom.hex(3)}@example.com",
      password: "password123",
      role: "school_admin"
    )
    @school_account = SchoolAccount.create!(
      school: @school,
      user: @account_user,
      responsible_person: "Yetkili",
      phone: "05000000002",
      status: :pending
    )
  end

  test "renders school accounts management dashboard" do
    get admin_school_accounts_url
    assert_response :success
    assert_select "h1", text: /Okul Hesapları Yönetimi/i
  end

  test "renders edit form" do
    get edit_admin_school_account_url(@school_account)
    assert_response :success
    assert_select "h1", text: /Okul Hesabı Düzenle/i
  end

  test "approves school account" do
    post approve_admin_school_account_url(@school_account)
    assert_redirected_to admin_school_account_url(@school_account)
    assert_equal "approved", @school_account.reload.status
  end
end
