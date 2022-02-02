class GroupsController < ApplicationController
  before_action :set_user, :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.all
    redirect_to teacher_groups_url(@user)
  end

  def show
    render "teachers/groups/show"
  end

  def new
    @group = Group.new
    render "teachers/groups/new"
  end

  def edit
    render "teachers/groups/edit"
  end

  def create
    @group = @user.groups.new(group_params)

    if @group.save
      redirect_to teacher_url(@user), notice: "Group was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @group.update(group_params)
      redirect_to teacher_groups_url(@user, @group), notice: "Group was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy

    redirect_to teacher_url(@user), notice: "Group was successfully destroyed."
  end

  private

  def set_user
    @user = User.find(params[:teacher_id])
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :from_time, :to_time, days_of_the_week: {})
  end
end
