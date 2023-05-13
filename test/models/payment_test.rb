require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  test "is not valid without amount" do
    payment = Payment.new
    refute payment.valid?

    assert_includes payment.errors.messages[:amount], "can't be blank"
  end
end
