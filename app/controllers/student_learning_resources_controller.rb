class StudentLearningResourcesController < ApplicationController
  before_action :authenticate_user!, :set_user

  def new
    @learning_resource = @user.learning_resources.all
    @members = User.where(id: my_students_ids)
  end

  def create
    @asignation = StudentLearningResource.new(assignee_params)

    if @asignation.save
      redirect_to teacher_learning_resources_url(@user), notice: "Learning resource was successfully assign."
    else
      redirect_to new_teacher_student_learning_resource_url(@user),
                  alert: "You already asigned this resource to the student"
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
    # TODO: nicer approach would be having a instance method responsible of getting that records
    @user.group_members.pluck(:user_id)
  end
end
