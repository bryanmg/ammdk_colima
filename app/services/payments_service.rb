class PaymentsService
  def initialize(payment_params)
    @debt = Debt.find(payment_params[:debt_id])
    @payment = Payment.new(payment_params)
  end

  def apply
    validate_amount
    ActiveRecord::Base.transaction do
      update_debt_status
      payment.save
    end
  end

  private

  attr_accessor :debt, :payment

  def update_debt_status
    return unless debt.debt_pending == payment.amount

    debt.update(status: DEBTS_STATUS[:paid])
  end

  def validate_amount
    raise OverflowPaymentException if payment.amount > debt.debt_pending
  end
end
