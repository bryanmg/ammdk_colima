class TeachersController < ApplicationController
  before_action :authenticate_user!, :set_user

  def show
    @groups = @user.groups.all
    @total_of_students = @user.group_members.count
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
    ActiveRecord::Base.transaction do
      @new_user = User.create(user_params.merge(password: new_user_temp_password))
      if @new_user.student?
        StudentInformation.create(student_information_params.merge(user: @user))
        GroupMember.create(user: @new_user, group_id: params[:user][:group])
      end
      return redirect_to teacher_path(@user),
                         notice: "#{@new_user.role.capitalize} was created with password #{new_user_temp_password}."
    end
    render :new, status: :unprocessable_entity
  end

  def update
    if @user.update(user_params)
      redirect_url = teacher_url(@user)
      redirect_url = teacher_students_url(current_user.id) if @user.student?

      return redirect_to redirect_url, notice: "#{@user.role.capitalize} was successfully updated."
    end
    render :edit, status: :unprocessable_entity
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

  def student_information_params
    params.require(:user).require(:student_information).permit(:ocupation, :civil_status, :tutor_name, :cellphone,
                                                               :health_insurance)
  end

  def new_user_temp_password
    Date.parse(user_params[:birth_date]).strftime('%d%m%y')
  end
end
