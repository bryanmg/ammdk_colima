class CreateStudentsLearningResources < ActiveRecord::Migration[7.0]
  def change
    create_table :students_learning_resources do |t|
      t.references :user, null: false, foreign_key: true
      t.references :learning_resource, null: false, foreign_key: true

      t.timestamps
    end
  end
end
