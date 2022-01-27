class TeachersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:new]

  def show
    @groups = @user.groups.all
    # TODO: All students of this profesor
    @students = nil
    # TODO: Add days of the weey to this query
    @in_progress_group = Group
                         .where("from_time <= ?", Time.new)
                         .where("to_time >= ?", Time.new)
                         .last
  end

  def new
    @new_user = User.new
  end

  def edit; end

  def create
    @new_user = User.new(user_params)
    # TODO: Add support to create students user
    temp_password = @new_user.birth_date.strftime('%d%m%y')
    @new_user.password = temp_password

    if @new_user.save
      redirect_to teacher_path(@user),
                  notice: "#{@new_user.role.capitalize} was successfully created with password #{temp_password}."
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
    user_id = if params.key?("id")
                params[:id]
              else
                current_user.id
              end
    @user = User.find(user_id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :name, :role, :birth_date, :belt)
  end
end
