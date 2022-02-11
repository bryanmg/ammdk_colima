require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:two)
    StudentInformation.create([{
                                ocupation: "Secundary student",
                                civil_status: "Married",
                                tutor_name: "Clark Rosmary",
                                cellphone: "3121230011",
                                health_insurance: "1234567890",
                                user: @user
                              }])
    sign_in users(:one) # require devise auth
  end

  test "should show student" do
    get student_url(@user)

    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@user)

    assert_response :success
  end

  test "should update student" do
    patch student_url(@user), params: {
      user: {
        email: users(:two).email,
        student_information_attributes: { tutor_name: "Duck Duck go", cellphone: "1234567890" }
      }
    }

    assert_redirected_to student_url(@user)
  end
end
