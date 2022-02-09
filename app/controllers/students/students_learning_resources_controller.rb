module Students
  class StudentsLearningResourcesController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      # TODO: could be better y we have something like '@student.student_learning_resources' at this point
      @student_learning_resources = @user.students_learning_resources
    end

    private

    def set_user
      @user = User.find(params[:student_id])
    end
  end
end
