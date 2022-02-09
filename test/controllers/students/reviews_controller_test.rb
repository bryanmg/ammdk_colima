require "test_helper"

module Students
  class ReviewsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:two)
      sign_in users(:two) # require devise auth
    end

    test "should get index" do
      get student_reviews_url(@user)

      assert_response :success
    end
  end
end
