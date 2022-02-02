class CreateStudentInformation < ActiveRecord::Migration[7.0]
  def change
    create_table :student_informations do |t|
      t.string :ocupation, null: false
      t.string :civil_status, null: false
      t.string :tutor_name
      t.string :cellphone, null: false
      t.string :health_insurance, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
