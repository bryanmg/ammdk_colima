module Teachers
  module Debts
    class PaymentsController < ApplicationController
      before_action :authenticate_user!, :set_user
      before_action :set_debt, oonly: [:new]

      def new
        @payment = Payment.new
      end

      def create
        @payment = Payment.new(payment_params)

        return redirect_to teacher_debts_url(@user), notice: "Payment was successfully applied." if @payment.save

        render :new, status: :unprocessable_entity
      end

      private

      def payment_params
        params.require(:payment).permit(:amount, :debt_id)
      end

      def set_user
        user_id = current_user.id || params[:id]
        @user = User.find(user_id)
      end

      def set_debt
        @debt = Debt.find(params[:debt_id])
      end
    end
  end
end
