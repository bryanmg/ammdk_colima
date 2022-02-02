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
  end
end
