class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :user, :group, :date, presence: true

  def attendance_recod_for
    group_by(&:user_id)
  end

  def create_or_update_for(attendances)
    create_or_update(attendances)
  end

  def self.upsert!(args)
    args.each do |att|
      is = att.delete(:present)

      return where(att).update(att.merge({ present: is })) if exists?(att)

      create!(att.merge({ present: is }))
    end
  end
end
