class TeachersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    # TODO: This could be a pagination method
    @groups = @user.groups.all
    @total_of_students = @user.group_members.count # TODO: Apply conty catch in to database
    @total_of_learning_resources = @user.learning_resources.count
    # TODO: Add days of the weey to this query
    @in_progress_group = @user.groups
                              .where("from_time <= ?", Time.new)
                              .where("to_time >= ?", Time.new).last
  end

  def new
    @new_user = User.new
  end

  def edit; end

  def create
    @new_user = User.new(user_params.merge(password: new_user_temp_password))
    # TODO: Add support to create students user

    if @new_user.save
      redirect_to teacher_path(@user),
                  notice: "#{@new_user.role.capitalize} was created with password #{new_user_temp_password}."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to teacher_url(@user), notice: "#{@user.role.capitalize} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to teachers_url, notice: "#{@user.role.capitalize} was successfully destroyed."
  end

  private

  def set_user
    user_id = params[:id] || current_user.id
    @user = User.find(user_id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :role, :birth_date, :belt)
  end

  def new_user_temp_password
    Date.parse(user_params[:birth_date]).strftime('%d%m%y')
  end
end
