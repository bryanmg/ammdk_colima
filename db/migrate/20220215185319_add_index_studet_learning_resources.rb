class AddIndexStudetLearningResources < ActiveRecord::Migration[7.0]
  def change
    add_index :student_learning_resources, [:user_id, :learning_resource_id], unique: true,
                                                                              name: "index_on_user_learning_resource"
  end
end
