require "test_helper"

class PaymentsServiceTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @debt = debts(:one)
  end

  test "should initialize an object" do
    assert PaymentsService.new({ amount: 10, debt_id: @debt.id })
  end

  test "should apply a payment" do
    payment = PaymentsService.new({ amount: 10, debt_id: @debt.id })

    assert payment.apply
  end

  test "should apply and update status when the debts is over" do
    payment = PaymentsService.new({ amount: @debt.debt_pending, debt_id: @debt.id })

    assert payment.apply
    assert @debt.status, DEBTS_STATUS[:paid]
  end

  test "should raise overflow payment exception if the payment is bigger than the debt" do
    payment = PaymentsService.new({ debt_id: @debt.id, amount: @debt.amount + 1 })

    assert_raises(OverflowPaymentException) { payment.apply }
  end
end
