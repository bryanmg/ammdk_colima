require "test_helper"

class AttendanceTest < ActiveSupport::TestCase
  test "is not valid without from user" do
    attendance = Attendance.new
    refute attendance.valid?

    assert_includes attendance.errors.messages[:user], "can't be blank"
  end

  test "is not valid without to group" do
    attendance = Attendance.new
    refute attendance.valid?

    assert_includes attendance.errors.messages[:group], "can't be blank"
  end

  test "is not valid without to date" do
    attendance = Attendance.new
    refute attendance.valid?

    assert_includes attendance.errors.messages[:date], "can't be blank"
  end

  test "is valid with user group and date" do
    attendance = Attendance.new(user: users(:one), group: groups(:one), date: Date.new)

    assert attendance.valid?
    assert attendance.save
  end
end
