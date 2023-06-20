class AddMontlyPaymentToStudentInformation < ActiveRecord::Migration[7.0]
  def change
    add_column :student_informations, :montly_payment, :money, default: 0

    # Drop column of user table
    remove_column :users, :montly_payment
  end
end
