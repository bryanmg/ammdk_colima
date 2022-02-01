class Teachers::LearningResourcesController < ApplicationController
  before_action :authenticate_user!, :set_user
  before_action :set_teachers_learning_resource, only: %i[ show edit update destroy ]

  def index
    @teacher_learning_resources = @user.learning_resources.all
  end

  def show
  end

  def new
    @teachers_learning_resource = @user.learning_resources.new
  end

  def edit
  end

  def create
    @teachers_learning_resource = @user.learning_resources.new(teachers_learning_resource_params)

    if @teachers_learning_resource.save
      redirect_to teachers_learning_resource_url(@teachers_learning_resource), notice: "Learning resource was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @teachers_learning_resource.update(teachers_learning_resource_params)
      redirect_to teachers_learning_resource_url(@teachers_learning_resource), notice: "Learning resource was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @teachers_learning_resource.destroy

    redirect_to teachers_learning_resources_url, notice: "Learning resource was successfully destroyed."
  end

  private

    def set_user
      user_id = current_user.id || params[:id]
      @user = User.find(user_id)
    end

    def set_teachers_learning_resource
      @teachers_learning_resource = LearningResource.find(params[:id])
    end

    def teachers_learning_resource_params
      params.require(:teachers_learning_resource).permit(:name, :description, :belt, :resource)
    end
end
