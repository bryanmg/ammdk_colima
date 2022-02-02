require "test_helper"

class AttendancesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @attendance = attendances(:one)
    @user = users(:one)
    sign_in users(:one) # require devise auth
    @group = @user.groups.create!(
      from_time: groups(:one).from_time,
      name: groups(:one).name,
      to_time: groups(:one).to_time
    )
  end

  test "should get index" do
    get teacher_group_attendances_url(@user, @group)

    assert_response :redirect
  end

  test "should get new" do
    get new_teacher_group_attendance_url(@user, @group)

    assert_response :success
  end

  test "should create attendance" do
    assert_difference("Attendance.count") do
      params = { attendance: { group_id: @group.id,
                               attendances: { @user.id.to_s => { user_id: @user.id, present: true } } } }
      post teacher_group_attendances_url(@user, @group), params: params
    end

    assert_redirected_to teacher_group_url(@user, @group)
  end

  test "should show attendance" do
    get teacher_group_attendances_url(@user, @group, @attendance)

    assert_response :redirect
  end
end
