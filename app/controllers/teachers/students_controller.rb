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
      @student = User.create(user_params.merge(password: new_user_temp_password, role: "student"))
      return redirect_to_index if @student.save

      render :new, status: :unprocessable_entity
    end

    def update
      @student.update(user_params)
      redirect_to teacher_students_url(@user), notice: "Student successfully updated."
    rescue StandardError
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

    def redirect_to_index
      redirect_to teacher_students_path(@user), notice: "Student created with password #{new_user_temp_password}."
    end

    def user_params
      params.require(:user).permit(
          :email, :password, :name, :role, :birth_date, :belt,
          group_member_attributes: [:group_id],
          student_information_attributes: [:ocupation, :civil_status, :tutor_name, :cellphone, :health_insurance]
      )
    end

    def student_information_params
      params.require(:user).permit(student_information_atributes: [:ocupation, :civil_status, :tutor_name, :cellphone,
                                                         :health_insurance])[:student_information]
    end

    def new_user_temp_password
      Date.parse(user_params[:birth_date]).strftime('%d%m%y')
    end
  end
end
