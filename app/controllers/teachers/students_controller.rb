module Teachers
  class StudentsController < ApplicationController
    before_action :authenticate_user!, :set_user
    before_action :set_student, only: [:show, :edit, :update, :destroy]

    def index
      @students = User.find(@user.group_members.map(&:user_id))
    end

    def show; end

    def new
      @student = User.new
    end

    def edit; end

    def create
      @student = User.new(user_params.merge(password: new_user_temp_password, role: "student"))
      if @student.save
        return redirect_to teacher_students_path(@user),
                           notice: "Student created with password #{new_user_temp_password}."
      end

      render :new, status: :unprocessable_entity
    end

    def update
      if @student.update(user_params)
        return redirect_to teacher_students_url(@user), notice: "Student successfully updated."
      end

      render :edit, status: :unprocessable_entity
    end

    def destroy
      @student.destroy
      redirect_to teacher_students_url(@user), notice: "Student successfully destroyed."
    end

    private

    def set_student
      @student = User.find(params[:id])
    end

    def set_user
      @user = User.find(params[:teacher_id])
    end

    def user_params
      params.require(:user).permit(
        :email, :password, :name, :role, :birth_date, :belt,
        group_member_attributes: [:group_id],
        student_information_attributes: [:ocupation, :civil_status, :tutor_name, :cellphone, :health_insurance]
      )
    end

    def new_user_temp_password
      Date.parse(user_params[:birth_date]).strftime('%d%m%y')
    end
  end
end
