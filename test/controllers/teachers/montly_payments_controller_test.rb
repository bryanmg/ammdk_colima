require "test_helper"

module Teachers
  class MontlyPaymentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      @user = users(:one)
      sign_in @user
    end

    test "should create montly payments for all students of a teacher" do
      group = @user.groups.create(
        from_time: groups(:one).from_time,
        name: groups(:one).name,
        to_time: groups(:one).to_time,
        days_of_the_week: { monday?: true }
      )
      student = users(:two)
      GroupMember.create([{ group_id: group.id, user_id: student.id }])

      assert_difference("Debt.count") do
        post teacher_montly_payments_url(@user), params: { teacher_id: @user.id }
      end

      assert_redirected_to teacher_debts_url(@user)
    end
  end
end
