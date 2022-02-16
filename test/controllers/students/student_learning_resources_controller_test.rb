require "test_helper"

module Students
  class StudentLearningResourcesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:two)
      sign_in users(:two) # require devise auth
    end

    test "should get index" do
      get student_student_learning_resources_url(@user)

      assert_response :success
    end
  end
end
