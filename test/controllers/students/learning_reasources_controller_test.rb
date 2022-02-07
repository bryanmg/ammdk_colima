require "test_helper"

module Students
  class LearningReasourcesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      sign_in users(:one) # require devise auth
    end

    test "should get index" do
      get student_learning_reasources_path(@user)

      assert_response :success
    end
  end
end
