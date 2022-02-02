require "test_helper"

class TeachersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in users(:one) # require devise auth
  end

  test "should get new" do
    get new_teacher_url

    assert_response :success
  end

  test "should create user and his role must be teacher" do
    assert_difference("User.count") do
      user_params = {
        email: "test_#{@user.email}",
        password: "123456",
        name: @user.name,
        role: @user.role,
        birth_date: @user.birth_date
      }
      post teachers_url(@user), params: { user: user_params, teacher_id: @user.id }
    end

    assert_redirected_to teacher_path(@user)
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
    user_params = { name: users(:two).name, birth_date: users(:two).birth_date }
    patch teacher_url(@user), params: { user: user_params }

    assert_redirected_to teacher_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete teacher_url(@user)
    end

    assert_redirected_to teachers_url
  end
end
