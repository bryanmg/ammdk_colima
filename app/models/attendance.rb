class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, :group, :date, presence: true

  def attendance_recod_for
    group_by(&:user_id)
  end
end
