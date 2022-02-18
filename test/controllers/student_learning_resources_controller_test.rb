require "test_helper"

class StudentLearningResourcesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in users(:one) # require devise auth
    @students_learning_resource = student_learning_resources(:one)
  end

  test "should get new" do
    get new_teacher_student_learning_resource_url(@user)

    assert_response :success
  end

  test "should create students_learning_resource" do
    assert_difference("StudentLearningResource.count") do
      post teacher_student_learning_resources_url(@user),
           params: { learning_resource_id: student_learning_resources(:two).learning_resource_id, user_id: @user.id }
    end

    assert_redirected_to teacher_learning_resources_url(@user)
  end
end
