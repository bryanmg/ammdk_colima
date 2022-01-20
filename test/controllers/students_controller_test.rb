require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post students_url, params: { user: test_student }
    end

    assert_redirected_to student_url(User.last)
  end

  test "should show user" do
    get student_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch student_url(@user), params: { user: { name: "Alpha time" } }
    assert_redirected_to student_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete student_url(@user)
    end
    assert_redirected_to student_url
  end

  private

  def test_student
    {
      email: "studentx@gmail.com",
      password: "123456",
      name: "Jhon Doe",
      role: "student",
      birth_date: "12/12/2010"
    }
  end
end
