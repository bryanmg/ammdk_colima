module Teachers
  class StudentsController < ApplicationController
    before_action :authenticate_user!, :set_user
    before_action :set_student, only: [:show]

    def index
      @students = User.find(@user.group_members.map(&:user_id))
    end

    def show; end

    private

    def set_student
      @student = User.find(params[:id])
    end

    def set_user
      user_id = current_user.id || params[:teacher_id]
      @user = User.find(user_id)
    end
  end
end
