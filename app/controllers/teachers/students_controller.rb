module Teachers
  class StudentsController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      @students = User.find(@user.group_members.map(&:user_id))
    end

    private

    def set_user
      user_id = current_user.id || params[:id]
      @user = User.find(user_id)
    end
  end
end
