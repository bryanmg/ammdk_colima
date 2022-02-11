module Students
  class ReviewsController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      @reviews = Review.where(student_id: @user.id).paginate(page: params[:page], per_page: PER_PAGE)
    end

    private

    # TODO: lets give more sense to this function, could be "set_student" and vaiable "@student"
    def set_user
      @user = User.find(params[:student_id])
    end
  end
end
