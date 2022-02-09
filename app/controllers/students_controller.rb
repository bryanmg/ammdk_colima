class StudentsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    @reviews = Review.where(student_id: @user.id).last(5)
    # TODO: is expected 'StudentsLearningResource' be linked to a 'student', not a 'user'
    @assigned_learning_resouces = StudentsLearningResource.where(user_id: @user.id).last(5)
  end

  def edit; end

  def update
    updated = false
    ActiveRecord::Base.transaction do
      # TODO: could be better if we apply 'accepts_nested_attributes_for' at this point
      @user.student_information.update(student_information)
      updated = @user.update(user_params)
    end
    if updated
      redirect_to student_url(@user), notice: "Profile was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    validate_input.except(:student_information)
  end

  def student_information
    validate_input[:student_information]
  end

  def validate_input
    params.require(:user).permit(:email, :password, student_information: [:tutor_name, :cellphone])
  end
end
