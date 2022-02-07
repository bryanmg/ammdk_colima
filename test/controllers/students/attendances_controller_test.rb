require "test_helper"

module Students
  class AttendancesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      sign_in users(:one) # require devise auth
    end

    test "should get index" do
      get student_attendances_url(@user)

      assert_response :success
    end

    test "should get index with custom dates" do
      get student_attendances_url(@user), params: { from_date: Date.yesterday, to_date: Date.tomorrow }

      assert_response :success
    end
  end
end
