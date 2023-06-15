class AddMontlyPaymentToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :montly_payment, :money, default: 0
  end
end
