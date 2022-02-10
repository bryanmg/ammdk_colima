module AttendanceHelper
  def attendance_percent_for(records, present: true)
    total_attendances = records.values.sum
    if total_attendances.positive?
      (records[present].to_f / total_attendances * 100).round(1)
    else
      0
    end
  end
end
