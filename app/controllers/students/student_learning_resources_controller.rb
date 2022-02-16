module Students
  class StudentLearningResourcesController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      # TODO: could be better y we have something like '@student.student_learning_resources' at this point
      @student_learning_resources = @user.student_learning_resources.paginate(page: params[:page],
                                                                              per_page: PER_PAGE)
    end

    private

    def set_user
      @user = User.find(params[:student_id])
    end
  end
end
