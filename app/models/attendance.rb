class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, :group, :date, presence: true
end
