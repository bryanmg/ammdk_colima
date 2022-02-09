module Students
  class ReviewsController < ApplicationController
    before_action :authenticate_user!, :set_user

    def index
      @reviews = Review.where(student_id: @user.id)
    end

    private

    def set_user
      @user = User.find(params[:student_id])
    end
  end
end
