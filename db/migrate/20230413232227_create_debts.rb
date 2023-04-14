class CreateDebts < ActiveRecord::Migration[7.0]
  def change
    create_table :debts do |t|
      t.money :amount, null: false
      t.string :concept, null: false
      t.string :description, null: true
      t.references :teacher, null: false, index: true
      t.references :student, null: false, index: true

      t.timestamps
    end

    add_foreign_key :debts, :users, column: :teacher_id
    add_foreign_key :debts, :users, column: :student_id
  end
end
