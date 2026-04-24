require "test_helper"

class School::ClassListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @school_admin = User.create!(
      email_address: "school-admin-#{SecureRandom.hex(3)}@example.com",
      password: "password123",
      role: "school_admin"
    )

    @school = School.create!(
      name: "Test Okul #{SecureRandom.hex(3)}",
      email: "school-#{SecureRandom.hex(3)}@example.com",
      tax_number: "#{rand(10**9..10**10 - 1)}",
      phone: "05000000000",
      status: :approved,
      address: "Adres"
    )

    SchoolAccount.create!(
      school: @school,
      user: @school_admin,
      responsible_person: "Yetkili",
      phone: "05000000001",
      status: :approved
    )

    @classroom = Classroom.create!(
      school: @school,
      name: "4-A",
      grade: "4",
      section: "A",
      active: true
    )

    @class_list = SchoolClassList.create!(
      school: @school,
      classroom: @classroom,
      name: "4-A İhtiyaç Listesi",
      academic_year: "2026-2027",
      semester: "Güz",
      version: 1,
      active: false
    )

    sign_in_as(@school_admin)
  end

  test "renders class lists index" do
    get school_class_lists_url
    assert_response :success
    assert_select "h1", text: /Sınıf Listelerini Yönet/i
  end

  test "renders new form" do
    get new_school_class_list_url
    assert_response :success
    assert_select "h1", text: /Yeni Sınıf Listesi/i
    assert_select "select[name='school_class_list[classroom_id]']"
  end

  test "creates class list" do
    assert_difference("SchoolClassList.count", 1) do
      post school_class_lists_url, params: {
        school_class_list: {
          classroom_id: @classroom.id,
          name: "4-A Güz Liste",
          academic_year: "2026-2027",
          semester: "Güz",
          version: 2,
          active: true
        }
      }
    end

    created = SchoolClassList.order(:created_at).last
    assert_redirected_to school_class_list_url(created)
  end

  test "renders show page" do
    get school_class_list_url(@class_list)
    assert_response :success
    assert_select "h1", text: /#{Regexp.escape(@class_list.name)}/i
  end

  test "renders edit form" do
    get edit_school_class_list_url(@class_list)
    assert_response :success
    assert_select "h1", text: /Sınıf Listesi Düzenle/i
  end

  test "updates class list" do
    patch school_class_list_url(@class_list), params: {
      school_class_list: {
        name: "Güncel Liste Adı",
        semester: "Bahar"
      }
    }

    assert_redirected_to school_class_list_url(@class_list)
    @class_list.reload
    assert_equal "Güncel Liste Adı", @class_list.name
    assert_equal "Bahar", @class_list.semester
  end

  test "publishes class list" do
    post publish_school_class_list_url(@class_list)
    assert_redirected_to school_class_list_url(@class_list)
    assert_equal true, @class_list.reload.active
  end

  test "unpublishes class list" do
    @class_list.update!(active: true)

    post unpublish_school_class_list_url(@class_list)
    assert_redirected_to school_class_list_url(@class_list)
    assert_equal false, @class_list.reload.active
  end

  test "renders versions page" do
    SchoolClassList.create!(
      school: @school,
      classroom: @classroom,
      name: @class_list.name,
      academic_year: @class_list.academic_year,
      semester: @class_list.semester,
      version: 2,
      active: true
    )

    get versions_school_class_list_url(@class_list)
    assert_response :success
    assert_select "h1", text: /Versiyonlar/i
  end

  test "deletes class list" do
    assert_difference("SchoolClassList.count", -1) do
      delete school_class_list_url(@class_list)
    end

    assert_redirected_to school_class_lists_url
  end
end
