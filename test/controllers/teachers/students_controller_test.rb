require "test_helper"

module Teachers
  class StudentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      sign_in users(:one)
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
        post teacher_students_url(@user), params: student_body
      end

      assert_redirected_to teacher_students_url(@user)
    end

    test "should create student with montly payment" do
      params = student_body
      params[:user][:student_information_attributes][:montly_payment] = 200
      assert_difference("User.count") do
        post teacher_students_url(@user), params: params
      end
      student = User.find_by(email: "test_#{@user.email}")

      assert_redirected_to teacher_students_url(@user)
      assert student.student_information.montly_payment, 200
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
      patch teacher_student_url(@user, users(:two)), params: student_body

      assert_redirected_to teacher_students_url(@user)
    end

    test "should destroy student" do
      assert_difference("User.count", -1) do
        delete teacher_student_url(@user, users(:two))
      end

      assert_redirected_to teacher_students_url(@user)
    end

    private

    def student_body
      { user: {
        email: "test_#{@user.email}", password: "123456", name: @user.name,
        role: @user.role, birth_date: @user.birth_date,
        student_information_attributes: {
          ocupation: "Secundary student", civil_status: "Married", tutor_name: "Clark Rosmary",
          cellphone: "3121230011", health_insurance: "1234567890", user: @user
        },
        group_id: groups(:one).id
      } }
    end
  end
end
