module Students
  class AttendancesController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      @attendances = @user.attendances.where("date >= ?", from_date).where("date <= ?", to_date)
      @attendance_record = @attendances.group(:present).count
    end

    private

    def set_user
      @user = User.find(params[:student_id])
    end

    def from_date
      params[:from_date] || Date.today.prev_month
    end

    def to_date
      params[:to_date] || Date.today
    end
  end
end
