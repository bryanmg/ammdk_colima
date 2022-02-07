class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :review, null: false
      t.references :learning_resource, foreign_key: true, null: true
      t.references :teacher, null: false
      t.references :student, null: false

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :teacher_id
    add_foreign_key :reviews, :users, column: :student_id
  end
end
