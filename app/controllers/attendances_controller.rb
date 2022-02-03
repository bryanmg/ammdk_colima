class AttendancesController < ApplicationController
  before_action :set_user, :set_group, :authenticate_user!
  before_action :set_attendance, only: [:show]

  def index
    @attendances = @group.attendances.where(date: params[:date])
    return redirect_to_group alert: "Not attendances for this day." if @attendances.count.zero?
  end

  def show; end

  def new
    @attendance = Attendance.new
  end

  def create
    return redirect_to_group(alert: "Attendance was taked for this group.") if attendance_already_taked

    attendances = []
    attendance_params[:attendances].each { |_key, item| attendances << make_attendance_field(item) }

    return redirect_to_group(notice: "Attendance was successfully created.") if Attendance.create!(attendances)

    render :new, status: :unprocessable_entity
  end

  private

  def attendance_already_taked
    attendance_data = { group: @group, date: Date.today }
    Attendance.where(attendance_data).present?
  end

  def redirect_to_group(params)
    redirect_to teacher_group_url(@user, @group), params
  end

  def make_attendance_field(entry)
    { group_id: @group.id, user_id: entry[:user_id], date: Date.today,
      present: ActiveRecord::Type::Boolean.new.cast(entry[:present]) }
  end

  def set_user
    @user = User.find params[:teacher_id]
  end

  def set_group
    @group = Group.find params[:group_id]
  end

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:group_id, attendances: {})
  end
end
