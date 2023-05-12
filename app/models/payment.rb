class Payment < ApplicationRecord
  belongs_to :debt

  validates :amount, presence: true
end
