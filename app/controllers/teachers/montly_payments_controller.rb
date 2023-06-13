module Teachers
  class MontlyPaymentsController < ApplicationController
    before_action :authenticate_user!, :set_user

    def create
      my_students.map do |student|
        student.user.debts.create!(
          amount: student.user.montly_payment,
          concept: "Mensualidad #{Date.today.strftime("%B")}",
          teacher: @user,
          status: "pending"
        )
      end

      redirect_to teacher_debts_url(@user), notice: "Review was successfully created."
    end

    private

    def set_user
      @user = User.find(params[:teacher_id])
    end

    def my_students
      @user.group_members
    end
  end
end
