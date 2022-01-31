class StudentsController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show; end

  def edit; end

  def update
    updated = false
    ActiveRecord::Base.transaction do
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
