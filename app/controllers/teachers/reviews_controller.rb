module Teachers
  class ReviewsController < ApplicationController
    before_action :authenticate_user!, :set_user
    before_action :set_teachers_review, only: [:show, :edit, :update, :destroy]

    def show; end

    def new
      @review = Review.new
    end

    def edit; end

    def create
      @review = Review.new(teachers_review_params.merge(teacher: @user))

      return redirect_to teacher_review_url(@user, @review), notice: "Review was successfully created." if @review.save

      render :new, status: :unprocessable_entity
    end

    def update
      if @review.update(teachers_review_params)
        redirect_to teacher_review_url(@user, @review), notice: "Review was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @review.destroy
      redirect_to teacher_reviews_url(@user), notice: "Review was successfully destroyed."
    end

    private

    def set_teachers_review
      @review = Review.find(params[:id])
    end

    def set_user
      @user = User.find(params[:teacher_id])
    end

    def teachers_review_params
      params.require(:review).permit(:review, :learning_resource_id, :student_id)
    end
  end
end
