class AttendancesController < ApplicationController
  before_action :set_user, :set_group, :authenticate_user!
  before_action :set_attendance, only: [:show]

  def index
    @attendances = make_attencances_record
    total_attendances

    return redirect_to_group alert: "Not attendances for this day." if @attendances.count.zero?
  end

  def show; end

  def new
    @attendance = Attendance.new
  end

  def create
    attendances = []
    attendance_params[:attendances].each { |_k, item| attendances << make_attendance_field(item) }

    return redirect_to_group(notice: "Attendance was successfully created.") if Attendance.upsert!(attendances)

    render :new, status: :unprocessable_entity
  end

  private

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

  def attendances_by_user
    @attendances_by_user ||= @group.attendances.where(date: [params[:from_date]..params[:to_date]]).group_by(&:user_id)
  end

  def total_attendances
    @total_attendances ||= attendances_by_user&.first&.last&.count
  end

  def make_attencances_record
    attendances_by_user&.map do |_key, val|
      { user_id: val.first.user_id, username: val.first.user.name, times: val.map(&:present).count { |x| x == true } }
    end
  end
end
