require "test_helper"

module Teachers
  class StudentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      sign_in users(:one) # require devise auth
    end

    test "should get index" do
      get teacher_students_url(@user)

      assert_response :success
    end

    test "should get show" do
      get teacher_student_url(@user, users(:two))

      assert_response :success
    end

    test "should create student" do
      assert_difference("User.count") do
        params = {
          user: {
            email: "test_#{@user.email}", password: "123456", name: @user.name,
            role: @user.role, birth_date: @user.birth_date,
            student_information: {
              ocupation: "Secundary student", civil_status: "Married", tutor_name: "Clark Rosmary",
              cellphone: "3121230011", health_insurance: "1234567890", user: @user
            },
            group_id: groups(:one).id
          }
        }
        post teacher_students_url(@user), params: params
      end

      assert_redirected_to teacher_students_url(@user)
    end

    test "should get new" do
      get new_teacher_student_url(@user)

      assert_response :success
    end

    test "should get edit" do
      get edit_teacher_student_url(@user, users(:two))

      assert_response :success
    end

    test "should update student" do
      params = {
        email: "test_#{@user.email}", password: "123456", name: @user.name,
        role: @user.role, birth_date: @user.birth_date,
        student_information: {
          ocupation: "Secundary student", civil_status: "Married", tutor_name: "Clark Rosmary",
          cellphone: "3121230011", health_insurance: "1234567890", user: @user
        },
        group_id: groups(:one).id
      }
      patch teacher_student_url(@user, users(:two)), params: { user: params }

      assert_redirected_to teacher_students_url(@user)
    end

    test "should destroy student" do
      assert_difference("User.count", -1) do
        delete teacher_student_url(@user, users(:two))
      end

      assert_redirected_to teacher_students_url(@user)
    end
  end
end
