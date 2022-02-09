module Students
  class AttendancesController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      @attendances = @user.attendances.where(date: from_date..to_date)
      @attendance_record = @attendances.group(:present).count
    end

    private

    # TODO: lets give more sense to this function, could be "set_student" and vaiable "@student"
    def set_user
      @user = User.find(params[:student_id])
    end

    def from_date
      params[:from_date] || 1.month.ago
    end

    def to_date
      params[:to_date] || Date.today
    end
  end
end
