class Debt < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"

  validates :amount, :concept, :teacher, :student, presence: true
end
