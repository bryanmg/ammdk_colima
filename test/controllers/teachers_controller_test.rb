require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_teacher_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post teachers_url, params: { user: test_teacher }
    end
    assert_redirected_to teacher_url(User.last)
  end

  test "should show user" do
    get teacher_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_teacher_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch teacher_url(@user), params: { user: { name: "Jhon Doe" } }
    assert_redirected_to teacher_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete teacher_url(@user)
    end
    assert_redirected_to teachers_url
  end

  private

  def test_teacher
    {
      email: "adminx@gmail.com",
      password: "123456",
      name: "Jhon Doe",
      role: "teacher",
      birth_date: "12/12/1995"
    }
  end
end
