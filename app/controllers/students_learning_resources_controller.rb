class StudentsLearningResourcesController < ApplicationController
  before_action :authenticate_user!, :set_user

  def new
    @learning_resource = @user.learning_resources.all
    @members = User.where(id: my_students_ids)
  end

  def create
    @asignation = StudentsLearningResource.new(assignee_params)

    if @asignation.save
      redirect_to teacher_learning_resources_url(@user), notice: "Learning resource was successfully assign."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def assignee_params
    params.permit(:user_id, :learning_resource_id)
  end

  def my_students_ids
    @user.group_members.map(&:user_id)
  end
end
