class AttendancesController < ApplicationController
  before_action :set_user, :set_group
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]

  def index
    @attendances = Attendance.all
  end

  def show; end

  def new
    @attendance = Attendance.new
  end

  def edit; end

  def create
    @attendance = Attendance.new(attendance_params)

    if @attendance.save
      redirect_to user_group_attendances_url(@user, @group, @attendance),
                  notice: "Attendance was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @attendance.update(attendance_params)
      redirect_to user_group_attendance_url(@user, @group, @attendance),
                  notice: "Attendance was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance.destroy

    redirect_to user_group_attendances_url(@user, @group), notice: "Attendance was successfully destroyed."
  end

  private

  def set_user
    @user = User.find params[:user_id]
  end

  def set_group
    @group = Group.find params[:group_id]
  end

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :group_id, :date)
  end
end
