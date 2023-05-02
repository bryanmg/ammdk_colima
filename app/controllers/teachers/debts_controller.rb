module Teachers
  class DebtsController < ApplicationController
    before_action :authenticate_user!, :set_user
    before_action :set_debt, only: [:edit, :update, :destroy]
    before_action :set_teacher_students
  
    def index
      # TODO: Add status to debt to know if is already payment
      @debts = @user.my_debts.paginate(page: params[:page], per_page: PER_PAGE)
    end

    def new
      @debt = @user.my_debts.new
    end
  
    def edit; end
  
    def create
      @debt = @user.my_debts.new(debt_params)

      return redirect_to teacher_debts_url(@user), notice: "Debt was created." if @debt.save

      render :new, status: :unprocessable_entity
    end
  
    def update
      return redirect_to teacher_debts_url(@user), notice: "Debt was updated." if @debt.update(debt_params)

      render :edit, status: :unprocessable_entity
    end
  
    def destroy
      @debt.destroy
  
      redirect_to teacher_debts_url(@user), notice: "Debt was successfully destroyed."
    end
  
    private
      def set_debt
        @debt = Debt.find(params[:id])
      end

      def debt_params
        params.require(:debt).permit(:amount, :concept, :teacher, :student, :description, :student_id)
      end

      def set_user
        user_id = current_user.id || params[:id]
        @user = User.find(user_id)
      end

      def my_students_ids
        # TODO: nicer approach would be having a instance method responsible of getting that records. (@teacher.students)
        @user.group_members.pluck(:user_id)
      end

      def set_teacher_students
        @my_students = User.where(id: my_students_ids).select(:name, :id)
      end
  end
end
