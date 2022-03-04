module Teachers
  class ReviewsController < ApplicationController
    before_action :authenticate_user!, :set_user
    before_action :set_teachers_review, only: [:show, :edit, :update, :destroy]
    before_action :set_teacher_students, only: [:new, :edit]

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
      student_id = @review[:student_id]
      @review.destroy
      redirect_to teacher_student_path(@user, student_id), notice: "Review was successfully destroyed."
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

    def my_students_ids
      # TODO: nicer approach would be having a instance method responsible of getting that records. (@teacher.students)
      @user.group_members.pluck(:user_id)
    end

    def set_teacher_students
      @my_students = User.where(id: my_students_ids).select(:name, :id)
    end
  end
end
