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
    @teacher = User.new
  end

  def edit; end

  def create
    @teacher = User.new(user_params.merge(password: new_temp_password, role: "teacher"))

    if @teacher.save
      return redirect_to teacher_path(@user), notice: "Teacher created with password #{new_temp_password}."
    end

    render :new, status: :unprocessable_entity
  end

  def update
    return redirect_to teacher_url(@user), notice: "Profile was successfully updated." if @user.update(user_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @user.destroy
    redirect_to teachers_url, notice: "Teacher was successfully destroyed."
  end

  private

  def set_user
    user_id = params[:id] || current_user.id
    @user = User.find(user_id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :birth_date, :belt)
  end

  def new_temp_password
    Date.parse(user_params[:birth_date]).strftime('%d%m%y')
  end
end
