require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    @debt = debts(:one)
    sign_in users(:one)
  end

  test "should get new" do
    get new_teacher_debt_payment_url(@user, @debt)

    assert_response :success
  end

  test "should create payment" do
    assert_difference("Payment.count") do
      post teacher_debt_payments_url(@user, @debt), params: { payment: { amount: 10, debt_id: @debt.id } }
    end

    assert_redirected_to teacher_debts_url(@user)
  end
end
