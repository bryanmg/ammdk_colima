class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.money :amount
      t.references :debt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
