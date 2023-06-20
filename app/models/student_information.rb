class StudentInformation < ApplicationRecord
  belongs_to :user

  validates :ocupation, :civil_status, :cellphone, :health_insurance, :montly_payment, presence: true
end
