class OverflowPaymentException < StandardError
  include ExceptionsConstants

  def initialize(msg = OVERFLOW_PAYMENT_EXCEPTION)
    super(msg)
  end
end
