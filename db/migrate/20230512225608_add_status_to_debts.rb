class AddStatusToDebts < ActiveRecord::Migration[7.0]
  def change
    add_column :debts, :status, :string, default: "pending"
  end
end
