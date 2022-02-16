class ChangeStudentsLearningResourcesToStudentLearningResources < ActiveRecord::Migration[7.0]
  def change
    rename_table :students_learning_resources, :student_learning_resources
  end
end
