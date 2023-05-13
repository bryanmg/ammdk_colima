class Debt < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"
  has_many :payment, dependent: :destroy

  validates :amount, :concept, :teacher, :student, presence: true
  enum :status, { pending: "pending", paid: "paid" }, default: nil

  def total_debt_payments
    payment.sum(:amount)
  end

  def debt_pending
    amount - payment.sum(:amount)
  end
end
