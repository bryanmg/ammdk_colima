require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attendance = attendances(:one)
    @user = users(:one)
    @fixture_group = groups(:one)
    @group = @user.groups.create!(
      from_time: @fixture_group.from_time,
      name: @fixture_group.name,
      to_time: @fixture_group.to_time
    )
  end

  test "should get index" do
    get user_group_attendances_url(@user, @group)

    assert_response :success
  end

  test "should get new" do
    get new_user_group_attendance_url(@user, @group)

    assert_response :success
  end

  test "should create attendance" do
    assert_difference("Attendance.count") do
      params = { attendance: { date: @attendance.date, group_id: @attendance.group_id, user_id: @attendance.user_id } }
      post user_group_attendances_url(@user, @group), params: params
    end

    assert_redirected_to user_group_attendances_url(@user, @group, Attendance.last)
  end

  test "should show attendance" do
    get user_group_attendances_url(@user, @group, @attendance)

    assert_response :success
  end

  test "should get edit" do
    get edit_user_group_attendance_url(@user, @group, @attendance)

    assert_response :success
  end

  test "should update attendance" do
    @new_attendance = attendances(:two)
    params = { 
      attendance: {
        date: @new_attendance.date, group_id: @new_attendance.group_id, user_id: @new_attendance.user_id
      }
    }
    patch user_group_attendance_url(@user, @group, @attendance), params: params

    assert_redirected_to user_group_attendance_url(@user, @group, @attendance)
  end

  test "should destroy attendance" do
    assert_difference("Attendance.count", -1) do
      delete user_group_attendance_url(@user, @group, @attendance)
    end

    assert_redirected_to user_group_attendances_url(@user, @group)
  end
end
